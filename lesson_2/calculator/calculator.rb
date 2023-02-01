# Command line calculator program that does the following:

# ask the user for two numbers
# ask the user for the type of operation to perform:
#   1) add
#   2) subtract
#   3) multiply
#   4) divide
# perform the operation on the two numbers
# displays the result

LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  if message.nil?
    Kernel.puts("=> #{key}")
  else
    Kernel.puts("=> #{message}")
  end
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

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()
  break unless name.empty?()
  prompt('valid_name')
end

puts("=> #{format(messages('greeting', LANGUAGE), name: name)}")

loop do
  number1 = ''
  number2 = ''

  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    prompt('invalid_number')
  end

  number1 = number1.to_f

  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    prompt('invalid_number')
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
    prompt('invalid_operation')
  end

  puts("=> #{format(messages('operation_message', LANGUAGE),
                    operator: operation_to_message(operator))}")
  sleep(1)

  result = case operator
           when '1' then number1 + number2
           when '2' then number1 - number2
           when '3' then number1 * number2
           when '4'
             if number2 == 0.0
               prompt('division_by_zero_error')
               next
             else
               number1 / number2
             end
           end

  puts("=> #{format(messages('result', LANGUAGE), result: result)}")

  answer = ''

  loop do
    prompt('again')
    answer = Kernel.gets().chomp().downcase()
    break if %w(y yes n no).include?(answer)
    prompt('again_error')
  end

  break if %w(n no).include?(answer)
end

prompt('goodbye')
