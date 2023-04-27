# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running total from the original Array.

def running_total(numbers)
  total = 0
  numbers.map { |number| total += number }
end

def running_total2(numbers)
  total = 0
  numbers.each_with_object([]) { |number, totals| totals << total += number }
end

def running_total3(numbers)
  totals = []
  numbers.inject(0) do |total, number|
    totals << total += number
    total
  end
  totals
end

# Examples:
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []

puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []

# A running total is the sum of all values in a list up to
# and including the current element. Thus, the running total when
# looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7),
# while the running total at index 3 is 47 (14 + 11 + 7 + 15).
