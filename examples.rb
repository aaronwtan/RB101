# 1. mutating vs. non-mutating, pass-by-reference/pass-by-value

def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')

def add_name2(arr, name)
  arr = arr << name
end

names2 = ['bob', 'kim']
add_name2(names, 'jim')

# 2. variable shadowing

n = 10

[1, 2, 3].each do |n|
  n = 'hello'
end

puts n

# 3. truthiness/falsiness

num = [1, 2, 3]

if num
  puts "Hello"
else
  puts "Goodbye"
end

# 4. short-circuiting

num = 5

if num > 0 || num / 0
  puts "Hello"
end

if num < 0 && num / 0
  puts "Goodbye"
end

# 5. method scope, reassignment is non-mutating, method parameters/arguments

item = 'hi'

def print_item(item)
  puts item
  item = 'goodbye'
end

print_item 'hello'      
puts item 

# 6. block scoping rules, method invocation followed by {} or do...end defines a block

a = 5

loop do
  a = 'hello'
  break
end

while true do
  b = 'hi'
  break
end

loop do
  c = 'goodbye'
  break
end

puts a
puts b
puts c

# 7. method scoping rules

def name
  "Aaron"
end

name = "Rakesh"

def display_name
  puts name
end

display_name

# 8.

name = "Aaron"

def name
  "Rakesh"
end

loop do
  puts name
  break
end

# 9.

# What will the following code print, and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

