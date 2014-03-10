module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new instance_url:  session['instance_url'],
                          oauth_token:   session['token'],
                          refresh_token: session['refresh_token'],
                          client_id:     ENV['SALESFORCE_KEY'],
                          client_secret: ENV['SALESFORCE_SECRET']
  end
end
