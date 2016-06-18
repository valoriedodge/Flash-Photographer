require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:my_photographer) { FactoryGirl.create(:photographer) }
  let(:my_review) { FactoryGirl.create(:review, photographer: my_photographer, user: my_user) }
  let(:other_review) { FactoryGirl.create(:review, photographer: my_photographer, user: other_user) }

  context "guest" do
        describe "POST create" do
            it "redirects the user to the sign in view" do
                post :create, photographer_id: my_photographer.id, review: {comment: Faker::Lorem.sentence}
                expect(response).to redirect_to(new_user_session_path)
            end
        end

        describe "DELETE destroy" do
            it "redirects the user to the sign in view" do
                delete :destroy, photographer_id: my_photographer.id, id: my_review.id
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end

    context "member user doing CRUD on a review they don't own" do
      before do
        @user = my_user
        @user.confirmed_at = Time.zone.now
        @user.save
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in @user
      end

        describe "POST create" do
            it "increases the number of reviews by 1" do
                expect{ post :create, photographer_id: my_photographer.id, review: {comment: Faker::Lorem.sentence} }.to change(Review,:count).by(1)
            end

            it "Doesn't create without a comment" do
                expect{ post :create, photographer_id: my_photographer.id, review: {comment: ""} }.to change(Review,:count).by(0)
            end

            it "redirects the user to the photographer show view" do
                post :create, photographer_id: my_photographer.id, review: {comment: Faker::Lorem.sentence}
                expect(response).to redirect_to([my_photographer])
            end
        end

        describe "DELETE destroy" do
            it "redirects the user to the photographer show view" do
                delete :destroy, photographer_id: my_photographer.id, id: other_review.id
                expect(response).to redirect_to([my_photographer])
            end
        end
    end

    context "user deleting a review they own" do
      before do
        @user = my_user
        @user.confirmed_at = Time.zone.now
        @user.save
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in @user
      end
      describe "DELETE destroy" do
        it "deletes the review" do
              count = Review.where({id: my_review.id}).count
              expect(count).to eq 1
              delete :destroy, photographer_id: my_photographer.id, id: my_review.id
        end
        it "deletes the review" do
              delete :destroy, photographer_id: my_photographer.id, id: my_review.id
              count = Review.where({id: my_review.id}).count
              expect(count).to eq 0
        end

        it "returns http success" do
              delete :destroy, photographer_id: my_photographer.id, id: my_review.id
              expect(response).to redirect_to([my_photographer])
        end
      end
    end

    context "admin deleting a review they don't own" do
      before do
        @user = my_user
        @user.confirmed_at = Time.zone.now
        @user.save
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in @user
        @user.admin!
      end

        describe "DELETE destroy" do
          it "deletes the review" do
                count = Review.where({id: other_review.id}).count
                expect(count).to eq 1
                delete :destroy, photographer_id: my_photographer.id, id: other_review.id
          end

          it "deletes the review" do
                delete :destroy, photographer_id: my_photographer.id, id: other_review.id
                count = Review.where({id: other_review.id}).count
                expect(count).to eq 0
          end
        end
    end

end
