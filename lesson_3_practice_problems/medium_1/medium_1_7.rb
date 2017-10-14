# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# A: The code will output '34' to the screen. The variable answer is
#    not modified by the method.