# Given this data structure write some code to return an array
# containing the colors of the fruits and the sizes of the
# vegetables. The sizes should be uppercase and the colors
# should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = []

hsh.each_value do |desc|
  if desc[:type] == 'fruit'
    new_arr << desc[:colors].map {|color| color.capitalize}
  else
    new_arr << desc[:size].upcase 
  end
end

p new_arr
