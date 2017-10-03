class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user
  before_action :set_locale

  def set_locale
    if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
      l = cookies[:educator_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:educator_locale] = l
    end
    I18n.locale = l
  end

  protected

  def configure_permitted_parameters
   added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation,:full_name,:age, :is_male,:level_of_education, :concentration, :institution_of_education, :location, :username, :bio, :role, :avatar,  :avatar_cache]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
