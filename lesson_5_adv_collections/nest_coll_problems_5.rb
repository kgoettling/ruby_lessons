# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

tot_male_age = 0

munsters.each do |_, desc|
  tot_male_age += desc['age'] if desc['gender'] == 'male'
end

puts tot_male_age

# Note, can use each_value instead of each because we're only
# referencing the hash values of the outer hash.