# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_ages = 0
ages.each {|key, value| sum_ages += value}
puts sum_ages

# Another solution

ages.values.inject(:+)