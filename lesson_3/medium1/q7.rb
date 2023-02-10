# q7: One day Spot was playing with the Munster family's home computer
# and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?
# yes; hashes are mutable, and furthermore performing element reassignment on a hash
# is destructive with respect to the hash object and will mutate the hash,
