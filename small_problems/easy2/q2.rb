# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 12**2
SQMETERS_TO_SQCENTIMETERS = 100**2

puts "Enter the length of the room in meters:"
length_meters = gets.to_f

puts "Enter the width of the room in meters:"
width_meters = gets.to_f

area_meters = length_meters * width_meters
area_feet = area_meters * SQMETERS_TO_SQFEET

puts format("The area of the room is %.1f square meters (%.2f square feet).", area_meters, area_feet)

# Further Exploration

# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square centimeters.

puts "Enter the length of the room in feet:"
length_feet = gets.to_f

puts "Enter the width of the room in feet:"
width_feet = gets.to_f

area_feet = length_feet * width_feet
area_inches = area_feet * SQFEET_TO_SQINCHES
area_centimeters = area_feet / SQMETERS_TO_SQFEET * SQMETERS_TO_SQCENTIMETERS

puts format("The area of the room is %.1f square feet (%.2f square inches or %.2f square centimeters).",
            area_feet, area_inches, area_centimeters)
