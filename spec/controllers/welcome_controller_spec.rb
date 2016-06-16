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

  describe "GET #photographers" do
    it "returns http success" do
      get :photographers
      expect(response).to have_http_status(:success)
    end

    it "renders the #photographers view" do
       get :photographers
       expect(response).to render_template :photographers
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
context "index with search" do
  before do
    @my_search = Search.create(zip_code: "94404")
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

     it "includes new_photographer in @photographers" do
      get :index
      expect(assigns(:search)).to eq(@my_search)
      expect(assigns(:search).zip_code).to eq("94404")
    end

     it "includes new_photographer in @photographers" do
      get :index
      expect(assigns(:photographers)).not_to include(my_photographer)
      expect(assigns(:photographers)).to include(new_photographer)
    end

  end
end

end
