# Write a method that displays an 8-pointed star in an nxn grid,
# where n is an odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

def star(n)
  top_lines = star_top(n)
  bottom_lines = top_lines.reverse
  center_line = ['*' * n]

  star_array = top_lines + center_line + bottom_lines
  puts star_array
end

def star_top(n)
  top_array = []
  max_distance_from_center = n / 2
  num_of_outer_spaces = 0
  num_of_inner_spaces = max_distance_from_center - 1

  max_distance_from_center.downto(1) do
    outer_spaces = ' ' * num_of_outer_spaces
    inner_spaces = ' ' * num_of_inner_spaces

    top_array << outer_spaces + '*' + inner_spaces + '*' + inner_spaces + '*' + outer_spaces

    num_of_outer_spaces += 1
    num_of_inner_spaces -= 1
  end

  top_array
end

# Examples:
star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
