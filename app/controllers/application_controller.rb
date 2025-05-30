class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permitir el campo 'name' al registrarse y actualizar perfil
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email, :password, :password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :email, :password, :password_confirmation, :current_password ])
  end
end
