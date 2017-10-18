# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# A: The return value of an if statement that is not invoked is nil.
# => The map method will return a new array containing everything
# => evaluated by the block. In this case, the first iteration returns
# => nil and the second iteration returns the value, so the return
# => value will be: [nil, 'bear'].