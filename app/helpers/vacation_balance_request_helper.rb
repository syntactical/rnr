module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new :host => 'test.salesforce.com',
                              :oauth_token => session[:token],
                              :refresh_token => session[:refresh_token],
                              :instance_url => session[:instance_url],
                              :client_id => ENV['SALESFORCE_SANDBOX_KEY'],
                              :client_secret => ENV['SALESFORCE_SANDBOX_SECRET']
  end
end
