# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def prompt(message)
  puts "==> #{message}"
end

def ask_for_n_numbers(n)
  numbers = []

  n.times do |i|
    if i == n - 1
      prompt("Enter the last number:")
    else
      prompt("Enter the #{ordinal(i + 1)} number:")
    end
    numbers << gets.to_i
  end
  numbers
end

def ordinal(n)
  n_str = n.to_s
  return n_str + 'th' if n_str[-2] == '1'

  case n_str[-1]
  when '1' then n_str + 'st'
  when '2' then n_str + 'nd'
  when '3' then n_str + 'rd'
  else          n_str + 'th'
  end
end

numbers = ask_for_n_numbers(60)
first_numbers = numbers[0..-2]
last_number = numbers.last

if first_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{first_numbers}."
else
  puts "The number #{last_number} does not appear in #{first_numbers}."
end
