# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end
  def update_resource(resource, params)
    if current_user.provider == "gihub"
      params.delete("current_password")
      resource.update_without_password(params)
    # else
      # resource.update_with_password(params)
    end
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present? ||
      params[:user][:password_confirmation].present?
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username,:bio,:city,:state,:title,:email, :password, :password_confirmation])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username,:bio,:city,:state,:title,:email, :password, :password_confirmation])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username,:bio,:city,:state,:title,:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:username,:bio,:city,:state,:title,:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username,:bio,:city,:state,:title,:email, :password, :password_confirmation])
  end

  # The path used after sign up.
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

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
