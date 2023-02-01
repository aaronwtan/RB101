# Loan calculator using formula:
# m = p * (j / (1 - (1 + j)**(-n)))
#
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
#
# inputs: loan amount
#         Annual Percentage Rate (APR)
#         loan duration
#
# calculate: monthly interest rate
#            loan duration in months
#            monthly payment
#
# outputs: monthly payment

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator.yml')

# Display message reformatted as a prompt given
# a key to loaded messages configuration file.
# If given string is not a key in the configuration file,
# reformat and display the given string.
def prompt(key)
  if MESSAGES.key?(key)
    message = MESSAGES[key]
    puts "=> #{message}"
  else
    puts "=> #{key}"
  end
end

# Return true if the interpreted characters
# of the given string is a valid number and false otherwise.
# Valid numbers are integers or floats and can be positive or 0.
def valid_number?(number_str)
  # first half of statement: matches optional + sign,
  #   0+ digits before decimal, optional decimal, 0+ digits after decimal
  # second half verifies there is at least one digit in the input
  number_str =~ /^ *+?\d*\.?\d* *$/ && number_str =~ /\d/
end

# Ask user for input and return a float if the input is a valid number
# that is positive or 0
def ask_number
  loop do
    # ask for user input and remove optional commas if provided
    number = gets.chomp.gsub(',', '')
    return number.to_f if valid_number?(number)
    prompt('invalid_value')
  end
end

# calculate monthly payment given loan amount, APR, and loan duration in months
def calculate_monthly_payment(loan_amount, apr, loan_duration)
  annual_interest_rate = apr / 100
  monthly_interest_rate = annual_interest_rate / 12

  if monthly_interest_rate == 0
    monthly_payment = loan_amount / loan_duration
  else
    monthly_payment = loan_amount *
                      (monthly_interest_rate /
                      (1 - (1 + monthly_interest_rate)**(-loan_duration)))
  end
  monthly_payment
end

# MAIN PROGRAM
prompt('welcome')
prompt('-------------------------------')

loop do
  prompt('ask_loan_amount')

  loan_amount = ask_number

  prompt('ask_apr')

  apr = ask_number

  prompt('ask_loan_duration')

  loan_duration = 0
  loop do
    prompt('ask_loan_duration_years')
    loan_duration_years = ask_number

    prompt('ask_loan_duration_months')
    loan_duration_months = ask_number

    loan_duration = loan_duration_years * 12 + loan_duration_months
    # break only if total loan duration is positive
    # this value unlike the loan amount and APR cannot be 0
    break if loan_duration > 0
    prompt('invalid_loan_duration')
  end

  monthly_payment = calculate_monthly_payment(loan_amount, apr, loan_duration)

  prompt('------------RESULTS------------')
  prompt(format(MESSAGES['result'], loan_amount, apr,
                loan_duration, monthly_payment))
  prompt('-------------------------------')
  prompt(format(MESSAGES['summary'], loan_amount, apr,
                loan_duration, monthly_payment))

  again = ''

  loop do
    prompt('again')
    again = gets.chomp.downcase
    break if %w(y yes n no).include?(again)
    prompt('invalid_response')
  end

  break if %w(n no).include?(again)
end

prompt('goodbye')
