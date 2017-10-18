# Create a hash that expresses the frequency with which each letter
# occurs in this string:

statement = "The Flintstones Rock"
# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letter_count = {}
arr_statement = statement.split('')
arr_statement.each do |letter|
  next if (letter_count.has_key?(letter) || letter == ' ')
  letter_count[letter] = arr_statement.count(letter)
end

puts letter_count