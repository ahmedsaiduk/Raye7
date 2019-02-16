# frozen_string_literal: true

# parent class of controllers
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :configure_devise_parameters, if: :devise_controller?

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role phone name])
  end
end
