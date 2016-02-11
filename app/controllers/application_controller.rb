class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
def configure_permitted_parameters
devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :avatar, :email, :password, :password_confirmation) }
devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
end
end
