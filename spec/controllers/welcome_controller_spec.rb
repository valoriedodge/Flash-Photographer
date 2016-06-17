require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:my_photographer) { FactoryGirl.create(:photographer) }
  let(:new_photographer) { FactoryGirl.create(:photographer, zip: "94404") }

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "renders the #about view" do
       get :about
       expect(response).to render_template :about
     end
  end

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
end
