# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# A: [1, nil, nil], this due to the fact that puts returns nil, so
# => when the condition of the if statement evaluates as true, then
# => it will puts the value to the screen and then add the nil return
# => value to the new array created by the map method.