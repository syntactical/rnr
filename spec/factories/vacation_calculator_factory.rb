FactoryGirl.define do
  factory :vacation_calculator do
    vacation_balance "2"
    start_date "02-01-2014"
    end_date "02-28-2014"
    accrual_rate "10"
  end
end