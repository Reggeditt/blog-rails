class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?, only: [:create]
  before_action :authenticate_user!
end

def configure_devise_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user|
    user.permit(:name, :email, :password, :password_confirmation)
  end
end
