# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme
# in which every other character is capitalized, and the remaining characters
# are lowercase. Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

def staggered_case(string)
  string.chars.map.with_index { |char, i| i.even? ? char.upcase : char.downcase }.join
end

# Example:
puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration

def staggered_case2(string, first_char_upper = true)
  uppercase = !first_char_upper

  string.chars.map do |char|
    uppercase = !uppercase
    uppercase ? char.upcase : char.downcase
  end.join
end

# Example:
puts staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case2('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS', true) == 'AlL_CaPs'
puts staggered_case2('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case2('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
puts staggered_case2('ALL_CAPS', false) == 'aLl_cApS'
puts staggered_case2('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'
