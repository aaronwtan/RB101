# Write a method that takes an Array of Integers between 0 and 19,
# and returns an Array of those Integers sorted based
# on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten,
# eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
# eighteen, nineteen

INTEGER_TO_WORDS = %w(zero one two three four five six seven eight nine
                      ten eleven twelve thirteen fourteen fifteen sixteen
                      seventeen eighteen nineteen)
                      
def alphabetic_number_sort(integer_array)
  integer_words = integer_array.map { |integer| INTEGER_TO_WORDS[integer] }
  integer_words.sort.map { |word| INTEGER_TO_WORDS.index(word)  }
end

# Examples:
puts alphabetic_number_sort((0..19).to_a) == [
       8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
       6, 16, 10, 13, 3, 12, 2, 0
     ]
