# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(num)
  digits = []

  while num > 0
    num, digit = num.divmod(10)
    digits.unshift(digit)
  end
  
  digits
end

# using string conversion

def digit_list2(num)
  num.to_s.chars.map(&:to_i)
end

# Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
