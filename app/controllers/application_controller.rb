class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login if Rails.env.production?

  def require_login
    if session[:userinfo]
      @current_user = session[:current_user]
    else
      redirect_to '/auth/saml'
    end
  end
end
