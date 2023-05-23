# Modify the method from the previous exercise so it ignores non-alphabetic characters
# when determining whether it should uppercase or lowercase each letter.
# The non-alphabetic characters should still be included in the return value;
# they just don't count when toggling the desired case.

def staggered_case(string)
  staggered_string = ''
  uppercase = true

  string.chars.each do |char|
    if char =~ /[a-z]/i
      if uppercase
        staggered_string << char.upcase
      else
        staggered_string << char.downcase
      end

      uppercase = !uppercase
    else
      staggered_string << char
    end
  end
  staggered_string
end

# Example:
puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


# Further Exploration
def staggered_case2(string, first_char_upper = true, count_non_alpha = true)
  uppercase = !first_char_upper

  staggered_chars = string.chars.map do |char|
    uppercase = !uppercase if count_non_alpha || char =~ /[a-z]/i
    uppercase ? char.upcase : char.downcase
  end

  staggered_chars.join
end

puts staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL CAPS') == 'AlL CaPs'
puts staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case2('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS', true) == 'AlL_CaPs'
puts staggered_case2('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case2('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'
puts staggered_case2('ALL_CAPS', false) == 'aLl_cApS'
puts staggered_case2('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'

puts staggered_case2('I Love Launch School!', true, true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('ALL_CAPS', true, true) == 'AlL_CaPs'
puts staggered_case2('ignore 77 the 444 numbers', true, true) == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case2('I Love Launch School!', true, false) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case2('ALL_CAPS', true, false) == 'AlL_cApS'
puts staggered_case2('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 nUmBeRs'
