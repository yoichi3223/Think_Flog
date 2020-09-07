class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?




def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
end







 protected

  def configure_permitted_parameters
    added_attrs = [ :email, :family_name,:first_name,:password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end
