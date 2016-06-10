class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
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
      params.require(:photographer).permit(:bio, :website, :yrs_experience)
  end
end
