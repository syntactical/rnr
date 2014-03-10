module VacationBalanceRequestHelper
  def client
    @client ||= Restforce.new instance_url:  'https://thoughtworks--RNR.cs2.my.salesforce.com',
                          oauth_token:   session['token']
  end
end
