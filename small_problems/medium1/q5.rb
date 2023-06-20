# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

def diamond(n, style = :solid)
  top_half = top_half(n, style)
  center = if style == :solid || n == 1
             ['*' * n]
           elsif style == :hollow
             ['*' + ' ' * (n - 2) + '*']
           else
             return puts 'Invalid style. Please enter :solid or :hollow'
           end
  bottom_half = top_half.reverse
  diamond_array = top_half + center + bottom_half
  puts diamond_array
end

def top_half(n, style)
  top_half_array = []
  (n / 2).downto(1) do |distance_from_center|
    num_of_stars = n - 2 * distance_from_center
    stars = '*' * num_of_stars
    stars[1...-1] = ' ' * (num_of_stars - 2) if style == :hollow && num_of_stars > 1
    top_half_array << stars.center(n)
  end
  top_half_array
end

# Examples:
diamond(1)

# *

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(101)

diamond(1, :hollow)
diamond(3, :hollow)
diamond(9, :hollow)
diamond(101, :hollow)
