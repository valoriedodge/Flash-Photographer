class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :bio, :website, :yrs_experience, :zip, :wttravel, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password) }
  end

  def require_sign_in
      unless current_user
          flash[:alert] = "You must be logged in to do that"

          redirect_to new_user_session_path
      end
  end
end
