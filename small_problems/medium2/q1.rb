gettysburg_text = File.read('gettysburg.txt')
pg84_text = File.read('pg84.txt')

def longest_sentence(text, file)
  sentences = text.split(/(?<=[.!?])\s*/)
  longest_sentence = sentences.max_by { |sentence| sentence.split.size }.strip
  number_of_words = longest_sentence.size

  puts "#{'-' * 80}\n>> Longest sentence of #{file}:\n"
  puts longest_sentence
  puts "\n>> which contains #{number_of_words} words."
end

longest_sentence(gettysburg_text, 'Gettysburg Address')
longest_sentence(pg84_text, 'Frankenstein pg 84')

# Further Exploration
def longest_paragraph(text, file)
  paragraphs = text.split(/\n{2,}/)
  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  number_of_words = longest_paragraph.size

  puts "#{'-' * 80}\n>> Longest paragraph of #{file}:\n"
  puts longest_paragraph
  puts "\n>> which contains #{number_of_words} words."
end

longest_paragraph(gettysburg_text, 'Gettysburg Address')
longest_paragraph(pg84_text, 'Frankenstein pg 84')

def longest_word(text, file)
  words = text.split(/[^a-z]/i)
  longest_word = words.max_by(&:length)

  puts "#{'-' * 80}\n>> Longest word of #{file}:\n"
  puts longest_word
  puts "\n>> which contains #{longest_word.length} letters."
end

longest_word(gettysburg_text, 'Gettysburg Address')
longest_word(pg84_text, 'Frankenstein pg 84')
