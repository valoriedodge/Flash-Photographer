class WelcomeController < ApplicationController

  def about
  end

  def photographers
  end

  def index
    @zip_code = params[:search_zip_code]
    if @zip_code
      @photographers = Photographer.where(zip: @zip_code)
    else
      @photographers = Photographer.all
    end
  end

end
