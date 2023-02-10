# q4: The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# this deletes the element of the caller at index 1 (in this case 2)
# numbers => [1, 3, 4, 5] after method call

numbers.delete(1)
# this deletes any 1 values in numbers
# numbers => [2, 3, 4, 5]