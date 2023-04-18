# Mad libs are a simple game where you create a story template with blanks for words.
# You, or another player, then construct a list of words and place them into the story,
# creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

# Example:

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

def get_word(word)
  article = word.start_with?(/[aeiou]/) ? 'an' : 'a'
  puts "Enter #{article} #{word}:"
  gets.chomp
end

noun = get_word('noun')
verb = get_word('verb')
adjective = get_word('adjective')
adverb = get_word('adverb')

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
