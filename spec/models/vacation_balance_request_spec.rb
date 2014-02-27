require 'spec_helper'

describe VacationBalanceRequest do
  context 'testing validation' do
    it 'should be valid' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request)

      vacation_balance_request.should be_valid
    end

    it 'should not be valid when end date is before start date' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request, start_date: '02-01-2014', end_date: '01-28-2014')

      vacation_balance_request.should_not be_valid
    end

    it 'should have start_date present' do
      should validate_presence_of(:start_date)
    end

    it 'should have end_date present' do
      should validate_presence_of(:end_date)
    end

    it 'should be numerical on vacation_balance' do
      should validate_numericality_of(:vacation_balance)
    end

    it 'should be numerical, only integer, and greater than 10 on accrual_rate' do
      should validate_numericality_of(:accrual_rate).only_integer.is_greater_than_or_equal_to(10)
    end

  end

  context 'testing persistence into database' do
    it 'should not persist into database' do
      vacation_balance_request = FactoryGirl.build(:vacation_balance_request)
      vacation_balance_request.persisted?.should be_false
    end
  end

end