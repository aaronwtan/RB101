# When will I Retire?
# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

current_year = Time.now.year

puts "What is your age?"
current_age = gets.to_i
puts "At what age would you like to retire?"
retirement_age = gets.to_i

years_until_retirement = retirement_age - current_age
retirement_year = current_year + years_until_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_until_retirement} years of work to go!"
