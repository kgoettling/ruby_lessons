# In an earlier practice problem we saw that depending on variables to 
# be modified by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# We learned that whether the above "coincidentally" does what we think
# we wanted "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier
# to predict and easier for the next programmer to maintain?

# A: We can change the method so that it doesn't modify the callers
#    but instead returns a new string and array. This way the
#    can be assured that when they're passing something into the
#    method, their original data won't be modified. This method is
#    especially bad because it modifies the array, but not the string.
#    Here is a better way to do it:

def better_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"

  return a_string_param, an_array_param
end