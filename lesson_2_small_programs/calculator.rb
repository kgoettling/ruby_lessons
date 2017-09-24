# Build a command line calculator program that does the following:
# - asks for two numbers
# - asks for type of operation: add, subtract, multiply, divide
# - displays the result
# Use the Kernel.gets() method to retrieve user input and use the
# Kernel.puts() method to display output


# NOTES:

# Input:
# => two numbers (any type) - check for numeric?
# => ask for an operation ('add', 'subtract', 'multiply' or 'divide')
# => retry if operation does not fit category
# Output:
# => the operation applied to the two numbers in order recieved

# Examples/Test Cases:
# calculate(1, 2, add) = 3
# calculate(3, 4, divide) = .75
# calculate(10, -1.1, multiply) = -11
# calculate(12, 13, subtract) = -1

# Algorithm
# => puts prompt for number
# => create method for getting numbers and repeating input
# => gets.chomp num1
# => check that gets.chomp isnumeric, if not reprompt
# => prompt for operator ("+, -, *, /")
# => gets.chomp operator
# => check that operator is in list of operators, if not reprompt
# => # => puts prompt for number
# => gets.chomp num2
# => check that gets.chomp isnumeric, if not reprompt
# => puts case selection for operation

def get_num()
    my_num = gets.chomp
end

def calculate(num1, num2, operation)
  case operation
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    num1 / num2
  end
end

op_arr = ['+', '-', '*', '/']

puts "What is your first number?"
num1 = get_num.to_f

puts "What operation do you want to perform? ('+', '-', '*', '/')"
operation = ""
loop do
  operation = gets.chomp
  break if op_arr.include?(operation)
  puts "That wasn't one of the listed operations."
  puts "Please choose '+', '-', '*' or '/'"
end

puts "What is your second number?"
num2 = get_num.to_f

answer = calculate(num1, num2, operation)

puts "#{num1} #{operation} #{num2} = #{answer}!"
