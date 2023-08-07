# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  shorter_side1 = sides[0]
  shorter_side2 = sides[1]
  longest_side = sides.last

  return :invalid unless (shorter_side1 + shorter_side2 > longest_side) && sides.all?(&:positive?)

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

# Examples:
puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
