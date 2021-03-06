require 'spec_helper'

describe VacationBalanceRequest do
  context '#valid?' do
    it 'should be valid' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request)

      vacation_balance_request.should be_valid
    end

    it 'should not be valid when end date is before start date' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request, start_date: '2014/02/01', end_date: '2014/01/28')

      vacation_balance_request.should_not be_valid
    end
    it { should allow_value('2014/03/06').for(:start_date) }
    it { should_not allow_value('03/06/2014').for(:end_date) }
    it { should validate_numericality_of(:vacation_balance) }
    it { should validate_numericality_of(:accrual_rate).only_integer.is_greater_than_or_equal_to(10) }
  end

  context '#persisted?' do
    it 'should not persist into database' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request)
      vacation_balance_request.persisted?.should be_false
    end
  end

end