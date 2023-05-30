# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

def buy_fruit(grocery_list)
  fruits = []
  grocery_list.each do |fruit, quantity|
    quantity.times { fruits << fruit }
  end
  fruits
end

# less readable one-liner

# def buy_fruit(grocery_list)
#   grocery_list.each_with_object([]) {|item, fruits| item[1].times { fruits << item[0] }}
# end

# refactored

# def buy_fruit(grocery_list)
#   grocery_list.each_with_object([]) do |(fruit, quantity), fruits|
#     quantity.times { fruits << fruit}
#   end
# end

# Example:
puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
    ["apples", "apples", "apples", "orange", "bananas","bananas"]
