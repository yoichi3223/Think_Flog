class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :contact]
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    top_index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :family_name, :first_name, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
