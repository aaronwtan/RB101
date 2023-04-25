# Write a method that takes two strings as arguments,
# determines the longest of the two strings,
# and then returns the result of concatenating the shorter string,
# the longer string, and the shorter string once again.
# You may assume that the strings are of different lengths.

def short_long_short(str1, str2)
  if str1.length < str2.length
    shorter_str = str1
    longer_str = str2
  else
    shorter_str = str2
    longer_str = str1
  end

  shorter_str + longer_str + shorter_str
end

# Examples:

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
