# frozen_string_literal: true

# parent class of controllers
class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :configure_devise_parameters, if: :devise_controller?

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role phone name])
  end

  def user_not_authorized
    msg = 'You are not authorized to perform this action.'
    flash[:alert] = msg
    if request.format == :html
      redirect_to(request.referrer || root_path)
    else
      render json: { errors: [msg] }, status: :forbidden
    end
  end

  protected

  def after_sign_in_path_for(_resource)
    if current_user.passenger?
      pickups_path
    elsif current_user.driver?
      trips_path
    end
  end
end
