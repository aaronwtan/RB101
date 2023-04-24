# Write a method that returns true if the string passed
# as an argument is a palindrome, false otherwise. A palindrome reads
# the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
  string == string.reverse
end

# Examples:

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

def palindrome2?(input)
  i = 0
  input_array = []
  reverse_input_array = []

  while i < input.size
    input_array << input[i]
    reverse_input_array << input[input.size - 1 - i]
    i += 1
  end

  input_array == reverse_input_array
end

puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false         # (case matters)
puts palindrome2?("madam i'm adam") == false # (all characters matter)
puts palindrome2?('356653') == true
puts palindrome2?([1, 2, 3]) == false
puts palindrome2?([1, 2, 2, 1]) == true
