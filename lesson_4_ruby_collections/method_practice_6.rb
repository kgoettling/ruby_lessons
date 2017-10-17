# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# A: The pop method removes the last value of the array and returns it,
# => and the size method returns an integer value for the number of 
# => characters in the supplied string. So, the return value here
# => should be the integer value 11, because size is being called
# => on the last value in the array returned by pop which is
# => 'caterpillar', there are 11 characters in 'caterpillar'.