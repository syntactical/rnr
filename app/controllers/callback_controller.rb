class CallbackController < ApplicationController
  skip_before_action :require_login
  skip_before_filter :verify_authenticity_token, only: [:store]

  def store
    session[:userinfo] = request.env['omniauth.auth']
    puts "#{request.env['omniauth.auth']['info']['name']} just authenticated"
    credentials = env["omniauth.auth"]["credentials"]
    session['token'] = credentials["token"]
    session['refresh_token'] = credentials["refresh_token"]
    session['instance_url'] = credentials["instance_url"]
    redirect_to root_path
  end

  def failure
    @error_msg = request.params['message']
  end
end