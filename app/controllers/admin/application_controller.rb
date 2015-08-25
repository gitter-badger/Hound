class Admin::ApplicationController < Administrate::ApplicationController
  before_action :authenticate_admin

  def index
    super

    flash[:alert] =
      "For performance, Administrate limits the index page to show 20 items.
      Customize this action to update/remove the limit,
      or implement the pagination library of your choice."
    @resources = @resources.limit(20)
  end

  private

  def authenticate_admin
    unless github_admin?
      redirect_to :root
    end
  end

  def github_admin?
    current_user && admin_github_handles.include?(current_user.github_username)
  end

  def current_user
    @current_user ||= User.find_by(remember_token: session[:remember_token])
  end

  def admin_github_handles
    ENV.fetch("ADMIN_GITHUB_HANDLES", "").split(",")
  end
end
