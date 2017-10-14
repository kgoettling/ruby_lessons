# One day Spot was playing with the Munster family's home computer 
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
# After writing this method, he typed the following...and before 
# Grandpa could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)
# Did the family's data get ransacked? Why or why not?

# A: Yes, the assignment happening in the method ends up being
#    destructive, even though the method doesn't have access to
#    the outer variable 'munsters' directly. This is due to the
#    fact that the data within the hash is being pointed to by
#    the method, so the objects within the hash still have the 
#    same object ids.