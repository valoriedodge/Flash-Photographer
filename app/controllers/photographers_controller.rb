class PhotographersController < ApplicationController
  before_action :get_ip


  def index
    @zip_code = params[:search_zip_code]
    if @zip_code
      @photographers = Photographer.where(zip: @zip_code)
    else
      @photographers = Photographer.all
    end
  end

  def show
    @photographer = Photographer.find(params[:id])
  end

  def edit
    @photographer = Photographer.find(params[:id])
  end

  def update
    @photographer = Photographer.find(params[:id])
    @photographer.assign_attributes(photographer_params)

    if @photographer.save
      flash[:notice] = "Profile was updated."
      redirect_to [@photographer]
    else
      flash.now[:alert] = "There was an error updating your profile. Please try again."
      render :edit
    end
  end

  private

  def photographer_params
      params.require(:photographer).permit(:bio, :website, :yrs_experience, :zip, :wttravel)
  end

  def get_ip
    #@ip_address = Geocoders::MultiGeocoder.geocode(request.remote_ip)
  end

end
