# Write a method that takes the 3 angles of a triangle as arguments,
# and returns a symbol :right, :acute, :obtuse, or :invalid depending
# on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry
# about floating point errors. You may also assume that the arguments are specified in degrees.

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless angles.sum == 180 && angles.all?(&:positive?)

  if angles.include?(90)
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

# Examples:
puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
