# app/controllers/pages_controller.rb

class PagesController < ApplicationController
  def square
    render({ template: 'page_templates/square' })
  end

  def square_results
    @num = params.fetch('number').to_f
    @result = @num**2
    render({ template: 'page_templates/square_results' })
  end

  def root
    render({ template: 'page_templates/square_root' })
  end

  def root_results
    @num = params.fetch('user_number').to_f
    @result = Math.sqrt(@num)
    render({ template: 'page_templates/square_root_results' })
  end

  def payment
    render({ template: 'page_templates/payment' })
  end

  def payment_results
    @apr = params.fetch('user_apr').to_f
    @num_of_years = params.fetch('user_years').to_i
    @principal = params.fetch('user_pv').to_f

    # Convert APR
    @monthly_rate = (@apr / 100) / 12

    # Convert Years to Months
    @num_of_months = @num_of_years * 12

    # Convert the Numerator and Denominator
    @numerator = @monthly_rate * (@principal * ((1 + @monthly_rate)**@num_of_months))
    @denominator = ((1 + @monthly_rate)**@num_of_months) - 1

    # Calculate the equation
    @payment = @numerator / @denominator
    render({ template: 'page_templates/payment_results' })
  end

  def random
    render({ template: 'page_templates/random' })
  end

  def random_results
    @user_min = params.fetch('user_min').to_f
    @user_max = params.fetch('user_max').to_f
    @result = rand(@user_min..@user_max).to_f
    render({ template: 'page_templates/random_results' })
  end
end
