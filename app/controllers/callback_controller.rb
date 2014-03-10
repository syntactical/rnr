class CallbackController < ApplicationController
  skip_before_action :require_login
  skip_before_filter :verify_authenticity_token, only: [:store]

  def store
    session[:userinfo] = request.env['omniauth.auth']
    credentials = request.env['omniauth.auth']['credentials']
    puts credentials['token']
    puts credentials['instance_url']
    redirect_to root_path
  end

  def failure
    @error_msg = request.params['message']
  end
end