class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_local, :joinus]
  skip_after_action :verify_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  def home_local
  end

  def joinus
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
