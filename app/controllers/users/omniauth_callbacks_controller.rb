# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
        sign_in_and_redirect(@user)
    else
        flash[:error] ='There was a problem signing you in through Github. Please try again later.'
        redirect_to new_user_registration_url
    end
end


def failure
    flash[:error]= 'There was a promblem signing you in. Please try again.'
    redirect_to new_user_registration_url
end 

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  protected
  
  def after_sign_up_path_for(user)
    if user.username.blank? || user.name.blank? || user.bio.blank? || user.city.blank? || user.state.blank?
      edit_user_registration_path(user)
    else
    users_root_path(user)
    end
  end

  def after_update_path_for(user)
    if user.username.blank? || user.name.blank? || user.bio.blank? || user.city.blank? || user.state.blank?
      edit_user_registration_path(user)
    else
    users_root_path(user)
    end
  end

  def after_sign_in_path_for(user)
    if user.username.blank? || user.name.blank? || user.bio.blank? || user.city.blank? || user.state.blank?
      edit_user_registration_path(user)
    else
    users_root_path(user)
    end
  end
  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
