# What is the return value of each_with_object in the following code?
# Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# A: The return value will be the following hash:
# => {'a'=>'ant', 'b'=>'bear', 'c'=>cat}
# => The method, each_with_object, takes whatever object type invoked
# => by the method and allows the block to modify that object, returning
# => the object at the end of the iteration.