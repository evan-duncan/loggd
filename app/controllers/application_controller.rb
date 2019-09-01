class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || journals_path
  end

  protected

    def configure_permitted_parameters
      add_attrs = [:handle, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
      devise_parameter_sanitizer.permit :account_update, keys: add_attrs
    end
end
