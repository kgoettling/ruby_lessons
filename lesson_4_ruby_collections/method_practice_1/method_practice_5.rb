# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# A: The shift method removes the first key/value pair from the hash
# => and returns it in array form. So, the return value of the
# => hash.shift in this code is: [:a, 'ant'], mutating the hash in the
# => process. You can find out how this works by consulting the ruby
# => documentation for shift in the Hash class.