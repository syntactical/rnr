class SessionsController < ApplicationController
  skip_before_action :require_login
  skip_before_filter :verify_authenticity_token, only: [:okta_store, :salesforce_store]

  def okta_store
    reset_session
    session[:userinfo] = request.env['omniauth.auth']
    redirect_to '/auth/salesforcesandbox'
  end

  def salesforce_store
    puts "#{request.env['omniauth.auth']['info']['name']} just authenticated"
    session[:current_user] = request.env['omniauth.auth']['info']['name']
    credentials = request.env["omniauth.auth"]["credentials"]
    session[:token] = credentials["token"]
    session[:refresh_token] = credentials["refresh_token"]
    session[:instance_url] = credentials["instance_url"]
    redirect_to root_path
  end

  def failure
    @error_msg = request.params['message']
    redirect_to '/auth/saml'
  end

  def destroy
    session[:userinfo] = nil
    reset_session
    redirect_to root_path
  end
end