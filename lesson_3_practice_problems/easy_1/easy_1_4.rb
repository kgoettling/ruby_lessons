# The Ruby Array class has several methods for removing items from 
#the array. Two of them have very similar names. Let's see how they 
# differ:

# What do the following method calls do (assume we reset numbers to 
# the original array between method calls)?

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
numbers.delete(1)

# A: 'delete_at' will delete whatever value is in the index number
#    specified. In this case, it will delete the value '2' from the
#    array. 'delete' removes any occurrences of the value specified
#    in the array, in this case the number '1' in index 0.