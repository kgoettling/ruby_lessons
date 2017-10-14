# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# A: The output is:
# => 'hi there'
# => '{:a=>"hi there"}'

# The reason being is that when we assigned informal_greeting
# we referred to the same object inside the hash. So, when we
# used the shovel operator, we mutated the object that we just 
# referred to, changing the object reference within the hash.