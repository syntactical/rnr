require 'spec_helper'

describe VacationCalculator do

  it 'should be valid' do
    vacation_calculator = FactoryGirl.build(:vacation_calculator)

    vacation_calculator.should be_valid
  end

  it 'should not be valid' do
    vacation_calculator = FactoryGirl.build(:vacation_calculator, end_date: '01-28-2014')

    vacation_calculator.should_not be_valid
  end
end