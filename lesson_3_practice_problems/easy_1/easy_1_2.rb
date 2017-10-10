# Describe the difference between ! and ? in Ruby. And explain what 
# would happen in the following scenarios:

# 1. what is != and where should you use it?
# A: '!=' is not 'not equals' conditional operator. It compares two
#    values and determines if they are equivalent
# 2. put ! before something, like !user_name
# A: '!' is a negation (not), so if 'user_name' was set to 'true',
#    then '!user_name' would return 'false'
# 3. put ! after something, like words.uniq!
# A: Typically when a '!' is after a method, it means that method is
#    destructive and mutates the caller. This is just a convention and
#    does not span all methods.
# 4. put ? before something
# A: This will just produce a syntax error unless somebody defines
#    a method that just happens to have a '?' in the front of it.
# 5. put ? after something
# A: '?' is both a ternary operator for one line 'if...else'
#    statements and it is often used as a descriptor at the end
#    of methods to show that it's returning a boolean.
# 6. put !! before something, like !!user_name
# A: This turns objects into boolean values based on their
#    'truthiness' it is often used to test for 'nil' or 'false'
#    values when it's not known which value will be produced

