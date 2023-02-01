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
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def messages(key)
  MESSAGES[key]
end

def prompt(message)
  puts "=> #{message}"
end

def display_separator
  prompt('-' * 31)
end

def display_results_header
  prompt('-' * 12 + 'RESULTS' + '-' * 12)
end

def display_greeting
  prompt(messages('welcome'))
  display_separator
  name = ask_name
  prompt(messages('greeting') + "#{name}!")
end

def display_calculating_message
  prompt(messages('calculating'))
  sleep(1)
end

def display_results(loan_amount, apr, loan_duration, monthly_payment)
  display_results_header
  prompt(format(messages('result_loan_amount'), loan_amount))
  prompt(format(messages('result_apr'), apr))
  prompt(format(messages('result_loan_duration'), loan_duration))
  prompt(format(messages('result_monthly_payment'), monthly_payment))
  display_separator
  prompt(format(messages('summary'), loan_amount, apr,
                loan_duration, monthly_payment))
end

def display_goodbye
  prompt(messages('goodbye'))
end

# Return true if the interpreted characters
# of the given string is a valid number and false otherwise.
# Valid numbers are integers or floats and can be positive or 0.
def valid_number?(number_str)
  # first half of statement: matches optional - or + sign,
  #   0+ digits before decimal, optional decimal, 0+ digits after decimal
  # second half verifies there is at least one digit in the input
  number_str =~ /^ *[-+]?\d*\.?\d* *$/ && number_str =~ /\d/
end

# Ask user for input and return a float if the input is a valid number
# that is positive, negative, or 0
def ask_number
  loop do
    # ask for user input and remove optional commas if provided
    number = gets.chomp.gsub(',', '')
    return number.to_f if valid_number?(number)
    prompt(messages('invalid_value'))
  end
end

def ask_name
  prompt(messages('ask_name'))
  loop do
    name = gets.chomp
    return name if !name.empty?
    prompt(messages('invalid_name'))
  end
end

def ask_loan_amount
  prompt(messages('ask_loan_amount'))
  loop do
    loan_amount = ask_number
    return loan_amount if loan_amount >= 0
    prompt(messages('invalid_loan_amount'))
  end
end

def ask_apr
  prompt(messages('ask_apr'))
  loop do
    apr = ask_number
    return apr if apr >= 0
    prompt(messages('invalid_apr'))
  end
end

def ask_loan_duration
  prompt(messages('ask_loan_duration'))
  loop do
    loan_duration_years = ask_loan_duration_years
    loan_duration_months = ask_loan_duration_months

    loan_duration = loan_duration_years * 12 + loan_duration_months
    # loan duration unlike the loan amount and APR cannot be 0
    return loan_duration if loan_duration > 0
    prompt(messages('invalid_loan_duration'))
  end
end

def ask_loan_duration_years
  loop do
    prompt(messages('ask_loan_duration_years'))
    loan_duration_years = ask_number
    return loan_duration_years if loan_duration_years >= 0
    prompt(messages('invalid_value'))
  end
end

def ask_loan_duration_months
  loop do
    prompt(messages('ask_loan_duration_months'))
    loan_duration_months = ask_number
    return loan_duration_months if loan_duration_months >= 0
    prompt(messages('invalid_value'))
  end
end

# Calculate monthly payment given loan amount, APR, and loan duration in months
def calculate_monthly_payment(loan_amount, apr, loan_duration)
  monthly_interest_rate = calculate_monthly_interest_rate(apr)

  if monthly_interest_rate == 0
    loan_amount / loan_duration
  else
    loan_amount *
      (monthly_interest_rate /
      (1 - (1 + monthly_interest_rate)**(-loan_duration)))
  end
end

def calculate_monthly_interest_rate(apr)
  annual_interest_rate = apr / 100
  annual_interest_rate / 12
end

# Ask user if they want to make another calculation
def calculate_again?
  loop do
    prompt(messages('again'))
    answer = gets.chomp.downcase
    if %w(y yes n no).include?(answer)
      return %w(y yes).include?(answer)
    end
    prompt(messages('invalid_response'))
  end
end

# MAIN PROGRAM
display_greeting

loop do
  loan_amount = ask_loan_amount
  apr = ask_apr
  loan_duration = ask_loan_duration

  display_calculating_message
  monthly_payment = calculate_monthly_payment(loan_amount, apr, loan_duration)

  display_results(loan_amount, apr, loan_duration, monthly_payment)

  break unless calculate_again?
end

display_goodbye
