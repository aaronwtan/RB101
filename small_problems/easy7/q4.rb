# Write a method that takes a string as an argument and returns a new string
# in which every uppercase letter is replaced by its lowercase version,
# and every lowercase letter by its uppercase version.
# All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  swapped_chars = string.chars.map do |char|
    case char
    when char.upcase then char.downcase
    when char.downcase then char.upcase
    end
  end
  swapped_chars.join
end

# Example:
puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
