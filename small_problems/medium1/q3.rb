# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits
# to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation
# of that argument. You can (and probably should) use the rotate_rightmost_digits method
# from the previous exercise.

# Note that you do not have to handle multiple 0s.

def max_rotation(num)
  num_of_digits = num.to_s.length
  num_of_digits.downto(2) { |n| num = rotate_rightmost_digits(num, n) }
  num
end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

def rotate_array(array)
  array[1..-1] << array[0]
end

# Example:
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration
def max_rotation2(num)
  num_str = num.to_s
  num_of_digits = num_str.length

  0.upto(num_of_digits - 1) do |n|
    num_str << num_str.slice!(n)
  end
  num_str.to_i
end

puts max_rotation2(7_352_910) == 3_217_950
puts max_rotation2(300) == 30
puts max_rotation2(35_000) == 50_300
puts max_rotation2(1_050_000) == 1050 # the leading zero gets dropped
puts max_rotation2(870_352_914_600_000) == 732_160_085_400_090
