class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        callback_from :facebook
    end

    def google_oauth2
        callback_for(:google)
    end

     def callback_for(provider)
    # 先ほどuser.rbで記述したメソッド(from_omniauth)をここで使っています
    # 'request.env["omniauth.auth"]'この中にgoogoleアカウントから取得したメールアドレスや、名前と言ったデータが含まれています
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  end

  def failure
    redirect_to root_path
  end

  private
    def callback_from(provider)
        provider = provider.to_s
        @user = User.find_for_oauth(request.env['omniauth.auth'])
      if @user.persisted?
         flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
         sign_in_and_redirect @user, event: :authentication
      else
         session["devise.#{provider}_data"] = request.env['omniauth.auth']
         redirect_to new_user_registration_url
      end
    end
end
