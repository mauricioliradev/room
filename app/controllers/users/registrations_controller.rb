class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
  end
end