FactoryGirl.define do
  factory :vacation_balance_request do
    vacation_balance "2"
    start_date "2014/02/01"
    end_date "2014/02/28"
    accrual_rate "10"
  end
end