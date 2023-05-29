# Write a method that returns a list of all substrings of a string
# that start at the beginning of the original string.
# The return value should be arranged in order from shortest to longest substring.

def leading_substrings(string)
  (1..string.length).map { |num_of_chars| string[0, num_of_chars] }
end

# Examples:
puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
