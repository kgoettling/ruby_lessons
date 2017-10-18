# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# A: The return value is [1, 2, 3] because the select method
# => returns an array where the block returns a "truthy" value. In
# => this case, even though line 4 returns false, the 'hi' at the end
# => of the block returns "truthy", so this makes every value
# => meet the criteria according to the select method.