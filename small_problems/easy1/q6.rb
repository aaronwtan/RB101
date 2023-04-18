# Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(n)
  n.times do |i|
    line = '*' * (i + 1)
    puts line.rjust(n)
  end
end

# Examples:

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Further Exploration
# Try modifying your solution so it prints the triangle upside down from its current orientation.
# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle2(n, orientation = 'lr')
  case orientation
  when 'ul'
    n.times do |i|
      line = '*' * (n - i)
      puts line
    end
  when 'ur'
    n.times do |i|
      line = '*' * (n - i)
      puts line.rjust(n)
    end
  when 'll'
    n.times do |i|
      line = '*' * (i + 1)
      puts line
    end
  when 'lr'
    n.times do |i|
      line = '*' * (i + 1)
      puts line.rjust(n)
    end
  else
    puts 'Invalid orientation given. Please enter ul (upper-left), ur (upper-right), ll (lower-left), or lr (lower-right).'
  end
end

triangle2(5)
triangle2(5, 'ul')
triangle2(5, 'ur')
triangle2(5, 'll')
triangle2(5, 'lr')

# refactored

def triangle3(n, orientation = 'lr')
  triangle_array = (1..n).map { |i| '*' * i }

  triangle_array.reverse! if orientation[0] == 'u'

  triangle_array.map! { |line| line.rjust(n) } if orientation[1] == 'r'

  puts triangle_array
end

triangle3(5)
triangle3(5, 'ul')
triangle3(5, 'ur')
triangle3(5, 'll')
triangle3(5, 'lr')
