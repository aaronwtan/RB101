# Given a string that consists of some words (all lowercased)
# and an assortment of non-alphabetic characters, write a method
# that returns that string with all of the non-alphabetic characters
# replaced by spaces. If one or more non-alphabetic characters occur
# in a row, you should only have one space in the result
# (the result should never have consecutive spaces).

def cleanup(str)
  str.gsub(/[^a-zA-Z]+/, ' ')
end

# Examples:
puts cleanup("---what's my +*& line?") == ' what s my line '

# Without String#gsub

def cleanup2(str)
  clean_str = ''
  str.chars.each do |char|
    clean_str << (('a'..'z').include?(char) ? char : ' ')
  end
  clean_str.squeeze(' ')
end

# Examples:
puts cleanup2("---what's my +*& line?") == ' what s my line '
