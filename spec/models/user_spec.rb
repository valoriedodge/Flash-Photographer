require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

describe "attributes" do
  it "defaults to standard for level" do
    expect(my_user.level).to eq "standard"
  end

  it "responds to level" do
   expect(my_user).to respond_to(:level)
 end

 it "responds to standard?" do
   expect(my_user).to respond_to(:standard?)
 end

 it "responds to premium?" do
   expect(my_user).to respond_to(:premium?)
 end

 it "responds to admin?" do
   expect(my_user).to respond_to(:admin?)
 end
end

describe "levels" do
    it "is standard by default" do
      expect(my_user.level).to eq("standard")
    end
  context "standard my_user" do
   it "returns true for standard?" do
     expect(my_user.standard?).to be_truthy
   end

   it "returns false for premium?" do
     expect(my_user.premium?).to be_falsey
   end

   it "returns false for admin?" do
     expect(my_user.admin?).to be_falsey
   end
 end

 context "premium my_user" do
   before do
     my_user.premium!
   end
   it "returns true for standard?" do
     expect(my_user.standard?).to be_falsey
   end

   it "returns false for premium?" do
     expect(my_user.premium?).to be_truthy
   end

   it "returns false for admin?" do
     expect(my_user.admin?).to be_falsey
   end
 end

 context "admin my_user" do
   before do
     my_user.admin!
   end
   it "returns true for standard?" do
     expect(my_user.standard?).to be_falsey
   end

   it "returns false for premium?" do
     expect(my_user.premium?).to be_falsey
   end

   it "returns false for admin?" do
     expect(my_user.admin?).to be_truthy
   end
 end
end
end
