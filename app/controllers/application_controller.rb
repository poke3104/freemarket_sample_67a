class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :configure_sign_up_params, if: :devise_controller?

  # protected

  # def configure_sign_up_params
  #   # binding.pry
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :birthday, :first_name, :last_name, :first_name_kana, :last_name_kana])
  #   binding.pry
  # end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
