require 'pry'

CARD_SCORE = {'Ace'=> [1, 11], '2'=> 2, '3'=> 3, '4'=> 4,
              '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, '10'=> 10,
              'Jack'=> 10, 'Queen'=> 10, 'King'=> 10}
ACE_SCENARIOS = [[0, 1], [1, 0], [1, 1], [2, 0], [2, 1], [3, 0], [3, 1], [4, 0]]

my_hand = ['Ace', '2', '3', '4', '5']


def show_cards(hand)
  hand.each {|_| print " _____ "}
  print "\n"
  hand.each {|card| print "|#{card[0]}    |"}
  print "\n"
  hand.each {|_| print "|     |"}
  print "\n"
  hand.each {|card| print "|    #{card[0]}|"}
  print "\n"
  hand.each {|_| print " ----- "}
  puts
end

show_cards(my_hand)