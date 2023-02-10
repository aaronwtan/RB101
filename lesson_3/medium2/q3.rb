# q3: Let's call a method, and pass both a string and an array as arguments
# and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkins"
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabaga"]

# my_string will be unchanged, because reassignment is not mutating
# my_array will be changed, because << is mutating
