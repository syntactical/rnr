module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new instance_url:  'https://cs2.salesforce.com',
                          oauth_token:   session['token']
  end
end
