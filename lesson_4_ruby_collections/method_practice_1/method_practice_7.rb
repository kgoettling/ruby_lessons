# What is the block's return value in the following code? How is it
# determined? Also, what is the return value of any? in this code.
# What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# A: The block's return value is always the last evaluated expression.
# => In this case, it will be the num.odd? return value for each
# => iteration. The return value of any? will be the boolean true,
# => but the output of the code will be:
# => 1
# => It only ever iterates once, because the any? method stops
# => iterating when it finds a value that returns true from the 
# => block.