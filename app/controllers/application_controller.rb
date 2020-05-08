class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username,:bio,:city,:state,:title])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:username,:bio,:city,:state,:title])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username,:bio,:city,:state,:title])
  end
end


