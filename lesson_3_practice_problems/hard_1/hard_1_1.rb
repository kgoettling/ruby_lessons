# What do you expect to happen when the greeting variable is
# referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# A: I expect an 'undefined variable' error, since the variable
#    was never assigned/initialized before calling it.

# After running the code it appears I was incorrect. Apparently a
# variable that goes unassigned in a block 'if' will default to
# the value 'nil'.