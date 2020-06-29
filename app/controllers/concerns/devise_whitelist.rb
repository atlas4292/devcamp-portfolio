module DeviseWhitelist
  extend ActiveSupport::Concern

  # This module is an assistant to change the device controllers permitted fields exactly like:
  # `params.require(:blog).permit(:title, :body)`    BUT we cannot

  included do
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    device_parameter_sanitize.permit(:sign_up, keys: [:name])
    device_parameter_sanitize.permit(:account_update, keys: [:name])
  end
end