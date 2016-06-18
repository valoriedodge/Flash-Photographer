require 'rails_helper'

RSpec.describe Photographer, type: :model do
  let(:my_photographer) { FactoryGirl.create(:photographer) }

  it { is_expected.to belong_to(:location)}

  it { is_expected.to validate_presence_of(:first_name)}
  it { is_expected.to validate_presence_of(:last_name)}
  it { is_expected.to validate_presence_of(:yrs_experience)}
  it { is_expected.to validate_presence_of(:bio)}
  it { is_expected.to validate_presence_of(:zip)}



  it {is_expected.to validate_length_of(:first_name).is_at_least(2)}
  it {is_expected.to validate_length_of(:last_name).is_at_least(2)}
  it {is_expected.to validate_length_of(:bio).is_at_least(5)}
  it {is_expected.to validate_length_of(:bio).is_at_most(500)}
  it {is_expected.to validate_numericality_of(:yrs_experience)}



   describe "attributes" do
     it "has first_name, last_name, bio, yrs_experience, zip, attributes" do
       expect(my_photographer).to have_attributes(
        first_name: my_photographer.first_name,
        last_name: my_photographer.last_name,
        yrs_experience: my_photographer.yrs_experience,
        bio: my_photographer.bio,
        zip: my_photographer.zip)
     end

     it "defaults for level and wttravel" do
       expect(my_photographer.level).to eq "standard"
       expect(my_photographer.wttravel).to eq false
     end

     it "responds to level" do
      expect(my_photographer).to respond_to(:level)
    end

    it "responds to standard?" do
      expect(my_photographer).to respond_to(:standard?)
    end

    it "responds to premium?" do
      expect(my_photographer).to respond_to(:premium?)
    end

    it "responds to admin?" do
      expect(my_photographer).to respond_to(:admin?)
    end
  end

  describe "levels" do
    it "is standard by default" do
      expect(my_photographer.level).to eq("standard")
    end
    context "standard my_photographer" do
      it "returns true for standard?" do
        expect(my_photographer.standard?).to be_truthy
      end

      it "returns false for premium?" do
        expect(my_photographer.premium?).to be_falsey
      end

      it "returns false for admin?" do
        expect(my_photographer.admin?).to be_falsey
      end
    end

    context "premium my_photographer" do
      before do
        my_photographer.premium!
      end
      it "returns true for standard?" do
        expect(my_photographer.standard?).to be_falsey
      end

      it "returns false for premium?" do
        expect(my_photographer.premium?).to be_truthy
      end

      it "returns false for admin?" do
        expect(my_photographer.admin?).to be_falsey
      end
    end

    context "admin my_photographer" do
      before do
        my_photographer.admin!
      end
      it "returns true for standard?" do
        expect(my_photographer.standard?).to be_falsey
      end

      it "returns false for premium?" do
        expect(my_photographer.premium?).to be_falsey
      end

      it "returns false for admin?" do
        expect(my_photographer.admin?).to be_truthy
      end
    end
   end


end
