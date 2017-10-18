# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# A: The return value is the array [1, 2, 3]. The reason being is our
# => call to the puts method makes the block return nil for all
# => iterations. Since the reject method will return an array with
# => all values where the block returns "falsey", it returns all values
# => in this case.