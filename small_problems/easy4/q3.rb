# In the modern era under the Gregorian Calendar, leap years occur
# in every year that is evenly divisible by 4, unless the year is also
# divisible by 100. If the year is evenly divisible by 100,
# then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0.
# Write a method that takes any year greater than 0 as input,
# and returns true if the year is a leap year, or false if it is not a leap year.

def leap_year?(year)
  year % 400 == 0 || ((year % 4 == 0) && !(year % 100 == 0))
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

def leap_year2?(year)
  if year % 4 == 0 
    if year % 100 == 0
      year % 400 == 0
    else
      true
    end
  else
    false
  end
end

puts leap_year2?(2016) == true
puts leap_year2?(2015) == false
puts leap_year2?(2100) == false
puts leap_year2?(2400) == true
puts leap_year2?(240000) == true
puts leap_year2?(240001) == false
puts leap_year2?(2000) == true
puts leap_year2?(1900) == false
puts leap_year2?(1752) == true
puts leap_year2?(1700) == false
puts leap_year2?(1) == false
puts leap_year2?(100) == false
puts leap_year2?(400) == true
