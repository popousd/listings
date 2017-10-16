class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  private

  def basic_auth
    if Rails.env == 'production'
      authenticate_or_request_with_http_basic do |username, password|
        username == "ruby" && password == "rails"
      end
    end
  end
end
