module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new instance_url:  'https://test.salesforce.com/services/oauth2/token',
                          oauth_token:   session['token']
  end
end
