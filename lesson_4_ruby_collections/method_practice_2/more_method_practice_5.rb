# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

name_index = 0

flintstones.each_with_index do |name, i|
  if (name[0,2] == "Be")
    name_index = i
    break
  end 
end

puts name_index

# Another solution

flintstones.index { |name| name[0, 2] == "Be" }