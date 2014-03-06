class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #skip_before_filter :verify_authenticity_token

  before_action :require_login if Rails.env.production?

  def require_login
    if session[:userinfo].nil?
    #  redirect_to root_path
    #else
      redirect_to '/auth/saml'
    end
  end
end
