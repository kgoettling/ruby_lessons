# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the
# values are the positions in the array.

# Input
# => array
# Output
# => hash
# => keys are the array values
# => values are indexed array positions

# Data Structures
# => array
# => hash
# => iterator (each_with_index)

# Algorithm
# create empty flint_hash
# iterate through the flintstones array using each_with_index
# assign each array value as key, index as value to flint_hash

flint_hash = {}

flintstones.each_with_index do |name, i|
  flint_hash[name] = i
end

puts flint_hash