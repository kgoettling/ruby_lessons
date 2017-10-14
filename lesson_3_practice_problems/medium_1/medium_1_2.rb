# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# A: The problem is that the code is trying to add an integer to a
#    string. The (40 + 2) needs to be converted to a string first.
#    Here are two ways this can be fixed:

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is " + "#{(40 + 2)}"