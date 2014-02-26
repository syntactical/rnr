class HomeController < ApplicationController
  def index
    @vacation_calculator = VacationCalculator.new
  end

  def calculate
    @vacation_calculator = VacationCalculator.new(vacation_calculator_params)
    @vacation_calculator.valid?
    render action: 'index'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vacation_calculator
    @vacation_calculator = VacationCalculator.find(params[:id])
  end

  def vacation_calculator_params
    params.require(:vacation_calculator).permit(:name, :start_date, :end_date, :accrual_rate, :create)
  end
end
