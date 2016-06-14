class WelcomeController < ApplicationController

  def about
  end

  def photographers
  end

  def index
    @photographers = Photographer.all
  end
end
