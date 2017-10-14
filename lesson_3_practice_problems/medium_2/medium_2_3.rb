# Let's call a method, and pass both a string and an array as
# parameters and see how even though they are treated in the
# same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...
# and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# A: Output:
# => My string looks like this now: pumpkins
# => My array looks like this now: ["pumpkins", "rutabaga"]

# The method uses the assignment operator on the string, which is not
# destructive and uses the shovel operator on the array which is
# destructive, so the object pointed to by the outer variable is 
# modified on the array and the method creates a new string object to
# point to instead of modifying the existing object.