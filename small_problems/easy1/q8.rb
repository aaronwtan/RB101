# Write a method that takes a positive integer as an argument
# and returns that number with its digits reversed.

def reversed_number(num)
  num.to_s.reverse.to_i
end

# Examples:

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

# Don't worry about arguments with leading zeros - Ruby sees those as octal numbers,
# which will cause confusing results. For similar reasons, the return value
# for our fourth example doesn't have any leading zeros.
