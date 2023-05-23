# Write a method that returns the next to last word
# in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(words)
  words.split.size >= 2 ? words.split[-2] : words
end

# Examples:
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
puts penultimate('word') == 'word'
puts penultimate('') == ''


# Further Exploration
# -----EDGE CASES-----
# Empty string => empty string
# 1 word => 1 word
# 2 words => 2 words
# Even number of words => middle 2 words

def middle_word(words)
  words_array = words.split
  number_of_words = words_array.size
  middle = number_of_words / 2

  if number_of_words.zero?
    words
  elsif number_of_words.even?
    words_array[middle - 1..middle].join(' ')
  else
    words_array[middle]
  end
end

puts middle_word('Launch School is the best!') == 'is'
puts middle_word('The middle of this sentence is this.') == 'this'
puts middle_word('Launch School is great!') == 'School is'
puts middle_word('word') == 'word'
puts middle_word('') == ''
