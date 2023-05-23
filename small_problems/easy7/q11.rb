# Write a method that counts the number of occurrences of each element in a given array.

def count_occurrences(array)
  occurences = Hash.new(0)
  array.each { |vehicle| occurences[vehicle.downcase] += 1 }

  occurences.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end

vehicles = [
  'car', 'CAR', 'tRuck', 'cAr', 'suv', 'TRUCK',
  'motorcycle', 'motorCYCLE', 'car', 'truck'
]

count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
