class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def current_team
    @current_team ||= current_user.team if user_signed_in?
  end
  helper_method :current_team
end
