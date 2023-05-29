# # Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position, the substrings
# at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

def substrings(string)
  substrings = []
  (0..string.length - 1).each do |starting_index|
    substrings += leading_substrings(string[starting_index..-1])
  end
  substrings
end

def leading_substrings(string)
  (1..string.length).map { |num_of_chars| string[0, num_of_chars] }
end

# Examples:
puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
