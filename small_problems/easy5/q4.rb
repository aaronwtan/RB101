# Given a string of words separated by spaces, write a method
# that takes this string of words and returns a string
# in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces.

def swap(words_string)
  words_array = words_string.split
  words_array.each { |word| word[0], word[-1] = word[-1], word[0] }
  words_array.join(' ')
end

# Examples:
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'


# utilizes multiple assignment
# a, b = b, a

# equivalent to
# =>
# 
# temporary = [b, a]
# a = temporary[0]
# b = temporary[1]
