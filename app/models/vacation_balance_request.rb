require 'active_model'

class VacationBalanceRequest
  include ActiveModel::Model

  attr_accessor :vacation_balance, :start_date, :end_date, :accrual_rate, :salesforce_text

  validates_numericality_of :vacation_balance
  validates_numericality_of :accrual_rate, only_integer: true, greater_than_or_equal_to: 10
  validate :validate_dates
  validates :start_date, format: { with: /\d{4}\/\d{2}\/\d{2}/, message: 'is not in format: yyyy/mm/dd'}
  validates :end_date, format: { with: /\d{4}\/\d{2}\/\d{2}/, message: 'is not in format: yyyy/mm/dd'}

  private
  def validate_dates
    if !start_date.nil? and !end_date.nil?
      errors.add(:end_date, "can't be before the start date") if end_date < start_date
    end
  end
end
