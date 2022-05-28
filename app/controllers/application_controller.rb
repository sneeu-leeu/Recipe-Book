class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :warning, :message
  protect_from_forgery prepend: true

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    root_path
  end
end
