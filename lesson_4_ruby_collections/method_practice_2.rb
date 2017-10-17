# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# A: The count method counts the number of elements in which the block
# => returns true. So, in this case, it should return 2. You can find
# => this out by reading the ruby documentation on the count method.