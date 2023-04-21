# Print all odd numbers from 1 to 99, inclusive,
# to the console, with each number on a separate line.

(1..99).each { |num| puts num if num.odd? }

# Further Exploration

1.upto(99) { |num| puts num if num.odd? }

# Even Further Exploration

puts (1..99).select(&:odd?)
