class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    p user_signed_in?
    redirect_to tasks_url if user_signed_in?
  end
end
