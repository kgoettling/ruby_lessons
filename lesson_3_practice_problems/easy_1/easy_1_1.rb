# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# A: It outputs:
# 1
# 2
# 2
# 3

# The reason is that 'uniq' does not mutate the array, so 'numbers'
# is not changed by the method call.