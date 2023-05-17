# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# array1 is first initialized to point to an array of names, and array2 is initialized to point to
# an empty array. When Array#each is called on array1, each element of array1 is passed as
# an argument into a block, with the local variable value initialized to point to each corresponding element.
# Because reference values are being passed, value is pointing at the original string elements in array1.
# Therefore when each element is appended to array2 using the << operator, these are the original string elements
# of array1 being appended. So when the elements of array1 are mutated on line 6 using the String#upcase!,
# the changes are reflected in the elements of array2. It should be noted that local variables array1 and array2
# do point at entirely different array objects, but these array objects contain elements that are the same objects
