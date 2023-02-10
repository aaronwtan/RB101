# Q1: What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# This code will print [1, 2, 2, 3], the original array.
# Array#uniq is non-mutating, so it does not alter numbers when it is called on it
