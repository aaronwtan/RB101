# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character
# of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# Examples
puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration

def word_cap2(string)
  capitalized_words = string.downcase.split
  capitalized_words.each { |word| word[0] = word[0].upcase }
  capitalized_words.join(' ')
end

puts word_cap2('four score and seven') == 'Four Score And Seven'
puts word_cap2('the javaScript language') == 'The Javascript Language'
puts word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

LOWERCASE_CHARS = ('a'..'z').to_a
UPPERCASE_CHARS = ('A'..'Z').to_a
LOWER_CASE_TO_UPPERCASE = LOWERCASE_CHARS.zip(UPPERCASE_CHARS).to_h

def word_cap3(string)
  words = string.split.each { |word| capitalize!(word) }
  words.join(' ')
end

def capitalize!(word)
  i = 0
  loop do
    char = word[i]
    if i.zero? && LOWERCASE_CHARS.include?(char)
      word[i] = LOWER_CASE_TO_UPPERCASE[char]
    elsif UPPERCASE_CHARS.include?(char)
      word[i] = LOWER_CASE_TO_UPPERCASE.key(char)
    end

    i += 1
    return word if i == word.size
  end
end

puts word_cap3('four score and seven') == 'Four Score And Seven'
puts word_cap3('the javaScript language') == 'The Javascript Language'
puts word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'
