require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }
  let(:my_photographer) { FactoryGirl.create(:photographer) }
  let(:my_review) { FactoryGirl.create(:review, photographer: my_photographer, user: my_user) }

  it { is_expected.to belong_to(:user)}
  it { is_expected.to belong_to(:photographer)}

  it { is_expected.to validate_presence_of(:comment)}
  it {is_expected.to validate_length_of(:comment).is_at_least(5)}

  describe "attributes" do
    it "has a comment" do
      expect(my_review).to have_attributes(comment: my_review.comment)
    end
  end

end
