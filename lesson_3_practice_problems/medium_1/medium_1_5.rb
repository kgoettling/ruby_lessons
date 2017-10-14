# Alyssa asked Ben to write up a basic implementation of a Fibonacci 
# calculator, A user passes in two numbers, and the calculator will 
# keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he 
# ran it, he got an error. Something about the limit variable. What's 
# wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# How would you fix this so that it works?

# A: The 'limit' variable is out of scope of the method. With the
#    exception of constants, methods do not have access to variables
#    defined outside of the method. To fix this, simply move the
#    'limit' initialization ('limit = 15') to the first line of the
#    method:

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
