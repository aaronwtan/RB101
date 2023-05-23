# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product
# of every pair of numbers that can be formed between the elements
# of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(numbers1, numbers2)
  products = []
  numbers1.each do |num1|
    numbers2.each { |num2| products << num1 * num2 }
  end
  products.sort
end

# Examples:
puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
