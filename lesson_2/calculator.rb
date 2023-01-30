# Command line calculator program that does the following:

# ask the user for two numbers
# ask the user for the type of operation to perform:
#   1) add
#   2) subtract
#   3) multiply
#   4) divide
# perform the operation on the two numbers
# displays the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# original integer validation used

# def valid_number?(num)
#   num.to_i().to_s() == num
# end

# refactored integer validation

# def valid_number?(num)
#   num =~ /^-?\d+$/
# end

# refactored number validation to included floats

def valid_number?(num)
  num =~ /^ *[-+]?\d*\.?\d*([e,E]\d)? *$/ && num =~ /\d/
  # first half of statement: matches optional preceding +/- sign,
  # 0+ digits before decimal, optional decimal, 0+ digits after decimal
  # second half verifies there is at least one digits in the input
end

def operation_to_message(operator)
  message = case operator
            when '1' then 'Adding'
            when '2' then 'Subtracting'
            when '3' then 'Multiplying'
            when '4' then 'Dividing'
            end
  message
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  break unless name.empty?()
  prompt("Make sure to use a valid name.")
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  number2 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    prompt("Invalid number. Please try again.")
  end

  number1 = number1.to_f

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    prompt("Invalid number. Please try again.")
  end

  number2 = number2.to_f

  operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt("Invalid operation. Please enter 1, 2, 3, or 4.")
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  sleep(1)

  result = case operator
           when '1' then number1 + number2
           when '2' then number1 - number2
           when '3' then number1 * number2
           when '4'
             if number2 == 0.0
               prompt("ERROR: Cannot divide by 0. Please choose a different
                operation or restart with new numbers.")
               next
             else
               number1 / number2
             end
           end

  prompt("The result is #{result}")

  answer = ''

  loop do
    prompt("Do you want to perform another calculation? (y/n)")
    answer = Kernel.gets().chomp().downcase()
    break if %w(y yes n no).include?(answer)
    prompt("Invalid answer. Please enter y or n.")
  end

  break if %w(n no).include?(answer)
end

prompt("Thank you for using calculator. Goodbye!")
