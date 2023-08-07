# Write a method that takes an Array as an argument,
# and sorts that Array using the bubble sort algorithm as just described.
# Note that your sort will be "in-place"; that is,
# you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

def bubble_sort!(arr)
  loop do
    swapped = false
    1.upto(arr.length - 1) do |i|
      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        swapped = true
      end
    end

    break unless swapped
  end
end

# # Examples:
# array = [5, 3]
# bubble_sort!(array)
# puts array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# puts array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration

def optimized_bubble_sort!(arr)
  nth = arr.length
  loop do
    new_nth = 0
    1.upto(nth - 1) do |i|
      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        new_nth = i
      end
    end
    nth = new_nth

    break if nth <= 1
  end
end

# Examples:
array = [5, 3]
optimized_bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
optimized_bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
optimized_bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
