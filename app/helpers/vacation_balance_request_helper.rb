module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new :host => 'test.salesforce.com',
                              instance_url:  'https://cs2.salesforce.com',
                          oauth_token:   session['token']
  end
end
