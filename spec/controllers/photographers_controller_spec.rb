require 'rails_helper'

RSpec.describe PhotographersController, type: :controller do
  let(:my_photographer) { FactoryGirl.create(:photographer)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
       get :index
       expect(response).to render_template :index
     end

     it "includes my_photographer in @photographers" do
      get :index
      expect(assigns(:photographers)).to include(my_photographer)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_photographer.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
       get :show, id: my_photographer.id
       expect(response).to render_template :show
     end

     it "assigns photographer to @photographers" do
       get :show, id: my_photographer.id
       expect(assigns(:photographer)).to eq(my_photographer)
     end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: my_photographer.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
       get :edit, id: my_photographer.id
       expect(response).to render_template :edit
     end

    it "assigns photographer to @photographers" do
      get :show, id: my_photographer.id
      expect(assigns(:photographer)).to eq(my_photographer)
    end

  end

  describe "GET #update" do
    it "updates photographer with expected attributes" do
      new_website = Faker::Internet.url
      new_bio = Faker::Lorem.paragraph
      new_yrs_experience = Faker::Number.between(1, 20)
      new_wttravel = true
      new_zip = Faker::Address::zip

      put :update, id: my_photographer.id, photographer: {website: new_website, bio: new_bio, yrs_experience: new_yrs_experience, wttravel: new_wttravel, zip: new_zip}

      updated_photographer = assigns(:photographer)
      expect(updated_photographer.id).to eq my_photographer.id
      expect(updated_photographer.bio).to eq my_photographer.bio
      expect(updated_photographer.website).to eq my_photographer.website
      expect(updated_photographer.yrs_experience).to eq my_photographer.yrs_experience
      expect(updated_photographer.zip).to eq my_photographer.zip
      expect(updated_photographer.wttravel).to eq my_photographer.wttravel

    end

    it "returns http redirect" do
      get :update, id: my_photographer.id, photographer: {}
      expect(response).to redirect_to my_photographer
    end

    it "doesn't update photographer with incorrect attributes" do
      new_website = Faker::Internet.url
      new_bio = Faker::Lorem.paragraph
      new_yrs_experience = "b"
      new_wttravel = true
      new_zip = Faker::Address::zip

      put :update, id: my_photographer.id, photographer: {website: new_website, bio: new_bio, yrs_experience: new_yrs_experience, wttravel: new_wttravel, zip: new_zip}

      expect(response).to redirect_to my_photographer
    end
  end

end
