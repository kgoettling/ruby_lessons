# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# A: The take method returns an array that contains the number of
# => values specified by its argument, starting from the beginning
# => of the array. In this case, it will return [1, 2]. It is not 
# => destructive, you can find out from the ruby documentation as the
# => documentation will always mention specifically if a method is 
# => destructive or not. You can also test it yourself by calling the
# => original object after invoking the method.