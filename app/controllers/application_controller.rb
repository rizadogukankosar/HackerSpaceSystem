class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :schoolNumber, :surname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar,:name, :phone, :schoolNumber, :surname, :email, :password, :password_confirmation])
  end
end
