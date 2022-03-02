class ApplicationController < ActionController::Base
   protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :telephone_number])
  end
end