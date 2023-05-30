# Write a method that takes an integer argument,
# and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(num)
  # Array.new(num) { |index| index + 1 }

  if num > 0 
    (1..num).to_a
  elsif num < 0
    (1..-num).to_a.map { |integer| -integer }
  else
    [0]
  end
end

# Examples:
puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-1) == [-1]
puts sequence(-5) == [-1, -2, -3, -4, -5]
puts sequence(0) == [0]
