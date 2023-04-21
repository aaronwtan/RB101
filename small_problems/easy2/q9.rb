# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# BOB
# BOB

# String#upcase! is a destructive method that mutates its caller. The name and save_name variables
# both initially point to the 'Bob' string object, so calling a mutating method on either name or save_name
# will be reflected in both name and save_name
