# q1: Every object in Ruby has access to a method called object_id,
# which returns a numerical value that uniquely identifies the object.
# This method can be used to determine whether two variables are pointing to the same object.

# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# a and c will have the same object id's because both reference the same object,
# but b will have a different object id although the value of this object is the same
