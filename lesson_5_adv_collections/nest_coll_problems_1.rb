# How would you order this array of number strings by descending
# numeric value?

arr = ['10', '11', '9', '7', '8']

# A:

p arr.sort {|num1, num2| num2.to_i <=> num1.to_i}

