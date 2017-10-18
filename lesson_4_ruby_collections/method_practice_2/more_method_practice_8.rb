# What happens when we modify an array while we are iterating over
# it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# A: If you're iterating over something and mutate it, you're going
# => to mess with the index references, producing usually unexpected
# => results, the output of this code would be:
# => 1
# => 3
# => This is due to the fact that we're removing values from the
# => front of the array, and the each iterator is always comparing
# => the size of the array currently on each iteration

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# A: In this case, since you're removing items from the end of the
# => array, the iterator will stop when the array ends after being
# => shortened:
# => 1
# => 2
