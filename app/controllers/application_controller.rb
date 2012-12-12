class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  def go_to_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  private
  def authorize
    redirect_to login_url, alert: 'Not authorized. Please login.' if current_user.nil?
  end

  def current_user
    warden.user
  end
  helper_method :current_user

  def warden
    env['warden']
  end
end
