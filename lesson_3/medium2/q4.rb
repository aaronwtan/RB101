# q4: To drive that last one home...let's turn the tables
# and have the string show a modified output,
# while the array thwarts the method's efforts to modify the user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# again, << is mutating and operates directly on the object referenced outside the method by my_string,
# so my_string is mutated
# for the array, an_array_param is reassigned, so it no longer references the same object
# that my_array references, so my_array is unchanged by the method
