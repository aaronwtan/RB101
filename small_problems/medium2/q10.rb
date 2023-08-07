# Write a method that computes the difference between the square of the sum
# of the first n positive integers and the sum of the squares of the first n positive integers.

def sum_square_difference(n)
  sum_square = (1..n).sum**2
  square_sum = (1..n).map { |num| num**2 }.sum

  sum_square - square_sum
end

# Examples:
puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
