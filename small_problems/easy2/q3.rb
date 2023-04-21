# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is the bill?"
subtotal = gets.to_f

puts "What is the tip percentage?"
tip_percent = gets.to_f
tip_rate = tip_percent / 100

tip = subtotal * tip_rate
total = subtotal + tip

puts format("The tip is $%.2f", tip)
puts format("The total is $%.2f", total)
