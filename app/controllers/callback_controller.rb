class CallbackController < ApplicationController
  skip_before_action :require_login, only: [:store]

  def store
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to root_path
    puts request.env['omniauth.auth']
  end

  def failure
    @error_msg = request.params['message']
  end
end