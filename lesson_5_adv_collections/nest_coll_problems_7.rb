# Given this code, what would be the final values of a and b?
# Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

puts a
p b
p arr

# A: a = 2, b = [3, 8], when arr is assigned, it creates a new pointer
# => referent that is not tied to a, so when we change arr[0], it
# => does not affect the value of a. b, however, is changed because
# => the collective element arr[1] is separate from b, but they both
# => both refer to same elements within b. If we were to reassign
# => arr[1], that would not change b, but if we reassign elements
# => within arr[1], we are then referring to the same objects as
# => b and are therefore also changing the values within b.