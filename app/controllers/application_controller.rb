class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password)}
  end
end
