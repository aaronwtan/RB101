# Write a method that takes a first name, a space, and a last name passed
# as a single String argument, and returns a string
# that contains the last name, a comma, a space, and the first name.

def swap_name(name)
  name.split.reverse.join(', ')
end

def swap_name2(name)
  first_name, last_name = name.split
  "#{last_name}, #{first_name}"
end

# Examples
puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts swap_name2('Joe Roberts') == 'Roberts, Joe'
