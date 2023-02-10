# q1: In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.
ages.key?("Spot")

# Bonus: What are two other hash methods that would work just as well for this solution?
ages.any? { |person, age| person = "Spot"}
ages.member?("Spot")
ages.include?("Spot")
