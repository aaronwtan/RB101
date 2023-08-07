# Write a method that takes a string as an argument, and returns true if all parentheses
# in the string are properly balanced, false otherwise. To be properly balanced,
# parentheses must occur in matching '(' and ')' pairs.

# def balanced?(str)
#   parentheses_balance = 0
#   str.each_char do |char|
#     parentheses_balance += 1 if char == '('
#     parentheses_balance -= 1 if char == ')'
#     break if parentheses_balance.negative?
#   end

#   parentheses_balance.zero?
# end
# def balanced?(string)
#   balances = Hash.new(0)
#   string.each_char do |char|
#     case char
#     when '('  then balances[:parentheses] += 1
#     when ')'  then balances[:parentheses] -= 1
#     when '['  then balances[:sq_brackets] += 1
#     when ']'  then balances[:sq_brackets] -= 1
#     when '{'  then balances[:curly_brackets] += 1
#     when '}'  then balances[:curly_brackets] -= 1
#     when '\'' then balances[:single_quotes] += (balances[:single_quotes].zero? ? 1 : -1) if balances[:double_quotes].zero?
#     when '"'  then balances[:double_quotes] += (balances[:double_quotes].zero? ? 1 : -1)
#     end
#     break if balances.values.any?(&:negative?)
#   end
#   balances.values.all?(&:zero?)
# end

PAIRS = { '(' => ')',
          '[' => ']',
          '{' => '}' }

def balanced?(str)
  brackets = []
  single_quotes = 0
  double_quotes = 0

  str.each_char do |char|
    if char == '\'' && double_quotes.zero?
      single_quotes += (single_quotes.zero? ? 1 : -1)
    elsif char == '"' && single_quotes.zero?
      double_quotes += (double_quotes.zero? ? 1 : -1)
    elsif PAIRS.keys.include?(char)
      brackets.push(char)
    elsif PAIRS.values.include?(char)
      opening_bracket = brackets.pop
      closing_bracket = PAIRS[opening_bracket]
      return false if closing_bracket != char
    end
  end
  brackets.empty? && single_quotes.zero? && double_quotes.zero?
end

# Examples:
puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
puts balanced?('What ())(is() up') == false

puts balanced?('()))What((()') == false
puts balanced?('{[((What) (is this))]?}') == true
puts balanced?("He said to me, \"You're my special friend!\"") == true
puts balanced?("He said to me, \"You're my special friend!") == false
puts balanced?("He said to me, 'You are indeed my special friend.'") == true
puts balanced?("He said to me, 'You are indeed my special friend.") == false
puts balanced?('({)}') == false