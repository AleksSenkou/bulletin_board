class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    def facebook
      @user = User.find_for_oauth(env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "facebook".capitalize) if is_navigation_format? # todo
      else
        session["devise.facebook_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def twitter
      @user = User.find_for_oauth(env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "twitter".capitalize) if is_navigation_format? # todo
      else
        session["devise.twitter_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def vkontakte
      @user = User.find_for_oauth(env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "vkontakte".capitalize) if is_navigation_format? # todo
      else
        session["devise.vkontakte_data"] = env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

  [:twitter, :facebook, :vkontakte].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
