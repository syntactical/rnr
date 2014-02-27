require 'active_model'

class VacationBalanceRequest
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :vacation_balance, :start_date, :end_date, :accrual_rate

  validates_numericality_of :vacation_balance
  validates_numericality_of :accrual_rate, only_integer: true, greater_than_or_equal_to: 10
  validates_presence_of :start_date, :end_date
  validate :validate_dates

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def validate_dates
    if !start_date.nil? or !end_date.nil?
      errors.add(:end_date, "can't be before the start date") if end_date < start_date
    end
  end
end
