# Using the each method, write some code to output all of the vowels
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |arr|
  arr.each do |word|
    word.split('').each do |letter| 
      puts letter if %w(a e i o u).include?(letter)
    end
  end
end
