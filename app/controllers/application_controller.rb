class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :update_allowed_parameters, if: :devise_controller?
  :after_sign_out_path_for

  private

  def current_user
    @current_user ||= warden.user
  end

  protected
  def after_sign_out_path_for(resource_or_scope)
    # Replace '/your_custom_path' with the path you want to redirect to after sign-out
    '/users/sign_in'
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bio, :email, :password, :current_password)}
  end
end
