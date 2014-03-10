class CallbackController < ApplicationController
  skip_before_action :require_login
  skip_before_filter :verify_authenticity_token, only: [:store]

  def store
    session[:userinfo] = request.env['omniauth.auth']
    puts "Credentials: " + request.env['omniauth.auth']['credentials']
    redirect_to root_path
  end

  def failure
    @error_msg = request.params['message']
  end
end