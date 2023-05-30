# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but
# in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

def anagrams(words)
  anagrams_hsh = Hash.new

  words.each do |word|
    sorted_word = word.chars.sort.join
    if anagrams_hsh.key?(sorted_word)
      anagrams_hsh[sorted_word] << word
    else
      anagrams_hsh[sorted_word] = [word]
    end
  end
  
  anagrams_hsh.each_value { |anagram_group| p anagram_group }
end

anagrams(words)
