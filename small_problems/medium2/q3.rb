# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters, and one the percentage
# of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  percentages = {}
  str_length = str.length.to_f

  percentages[:lowercase] = ((str.count('a-z') / str_length) * 100).round(1)
  percentages[:uppercase] = ((str.count('A-Z') / str_length) * 100).round(1)
  percentages[:neither] = 100 - percentages[:lowercase] - percentages[:uppercase]

  percentages
end

# Examples
puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

puts letter_percentages('abcdefGHI')
