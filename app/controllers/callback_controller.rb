class CallbackController < ApplicationController
  def store
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to root_path
  end

  def failure
    @error_msg = request.params['message']
  end
end
