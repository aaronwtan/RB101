# Write a method that determines and returns the ASCII string value
# of a string that is passed in as an argument. The ASCII string value
# is the sum of the ASCII values of every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(str)
  ascii_values = str.chars.map { |char| char.ord }
  ascii_values.sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# Further Exploration
char = 'a'
puts char.ord.chr == char

# will not work on strings longer than a single character because String#ord
# only works on a one character string and will ignore the rest of a longer
# string invoking the method

