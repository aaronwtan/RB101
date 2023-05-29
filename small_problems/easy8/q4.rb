# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards
# as it does backwards. The return value should be arranged in the same sequence
# as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters
# and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba"
# nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def palindromes(string)
  substrings = substrings(string)
  substrings.select { |substring| palindrome?(substring) }
end

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

def palindrome?(string)
  string == string.reverse && string.length > 1
end

# Examples:
puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
def palindromes2(string)
  substrings = substrings(string)
  substrings.select { |substring| alphanum_palindrome?(substring) }
end

def alphanum_palindrome?(string)
  clean_string = string.downcase.scan(/[a-z0-9]/)
  clean_string == clean_string.reverse && clean_string.length > 1
end

p palindromes2('hello-Madam-did-madam-goodbye')
p palindromes2('knitting cassettes')
p palindromes2("Madam I'm Adam")
p palindromes2('A man, a plan, a cat, a canal, Panama!')
