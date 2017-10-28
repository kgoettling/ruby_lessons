require 'pry'

CARD_SCORE = {'Ace'=> [1, 11], '2'=> 2, '3'=> 3, '4'=> 4,
              '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, '10'=> 10,
              'Jack'=> 10, 'Queen'=> 10, 'King'=> 10}
ACE_SCENARIOS = [[0, 1], [1, 0], [1, 1], [2, 0], [2, 1], [3, 0], [3, 1], [4, 0]]

def prompt(msg)
  puts "=> #{msg}"
end

def init_deck
  new_deck = []
  all_cards = ['Ace', '2', '3', '4', '5', '6', '7'] + 
              ['8', '9', '10', 'Jack', 'Queen', 'King']
  4.times do
    all_cards.each do |card|
      new_deck << card
    end
  end
  new_deck.shuffle
end

def deal_card!(my_deck)
  my_deck.pop
end

def player_hit_or_stay
  valid_responses = ['h', 's', 'hit', 'stay']
  user_resp = ''
  loop do
    prompt "Do you want to hit or stay (h/s)?"
    user_resp = gets.chomp
    break if valid_responses.include?(user_resp)
    prompt "That was not a valid response"
  end
  user_resp.downcase.start_with?('h') ? user_resp = 'hit' : user_resp = 'stay'
  user_resp
end

def dealer_turn(my_deck, d_hand, p_hand)
  return d_hand if calc_card_tot(p_hand).to_i >= 21

  while calc_card_tot(d_hand).to_i < 17
   d_hand << deal_card!(my_deck)
  end
  d_hand
end

def print_cards(hand)
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

def show_player_hand(p_hand, dealer_turn=false)
  prompt "Your hand: "
  print_cards(p_hand)
  prompt "You currently have: #{calc_card_tot(p_hand)}"
  puts
end

def show_dealer_hand(d_hand, show_card=false, dealer_turn=false)
  show_hand = d_hand.dup
  show_hand[0] = 'facedown card' unless show_card
  if dealer_turn
    prompt "Dealer hand: "
    print_cards(d_hand)
    prompt "Dealer has: #{calc_card_tot(d_hand)}"
  else
    prompt "Dealer hand: "
    print_cards(show_hand)
  end
  puts
end

def disp_dealer_win_lose(d_hand, p_hand, dealer_turn=false)
  case calc_win_lose(d_hand, p_hand, dealer_turn)
  when -2 then prompt 'The dealer busted!'
  when -1 then prompt 'The dealer loses!'
  when 1 then prompt 'The dealer wins!'
  end
  puts
end

def disp_player_win_lose(p_hand, d_hand, dealer_turn=false)
  case calc_win_lose(p_hand, d_hand, dealer_turn)
  when -2 then prompt 'You busted!'
  when -1 then prompt 'You lose!'
  when 1 then prompt 'You win!'
  when 2 then prompt "It's a push!"
  end
  puts
end

def calc_card_tot(hand)
  card_tot = 0
  ace_count = 0
  hand.each do |card|
    card == 'Ace' ? ace_count += 1 : card_tot += CARD_SCORE[card]
  end
  return card_tot.to_s if ace_count == 0
  calc_tot_ace(card_tot, ace_count)
end

def calc_tot_ace(total, ace_num)
  valid_tots = []
  all_tots = []
  ACE_SCENARIOS.each do |scenario|
    check_tot = total
    next unless scenario.sum == ace_num
    scenario.each_with_index do |value, i|
      check_tot += value * CARD_SCORE['Ace'][i]
    end
    all_tots << check_tot
    valid_tots << check_tot if check_tot <= 21
  end
  valid_tots.empty? ? valid_tots = all_tots.sort[0] : valid_tots = valid_tots.sort.last

  valid_tots.to_s
end

def calc_win_lose(hand1, hand2=[], dealer_turn=false)
  hand1_tot = calc_card_tot(hand1).to_i
  hand2_tot = calc_card_tot(hand2).to_i

  if dealer_turn
    case hand1_tot
    when (22..99) then return -2
    when 21 then return 1
    when hand2_tot then return 2
    when (2..hand2_tot)
      if hand2_tot > 21 
        return 1
      else
        return -1
      end
    else return 1
    end
  end

  case hand1_tot
  when (2..20) then return 0
  when (22..99) then return -2
  when 21 then return 1
  end

end

system 'cls'
prompt "Welcome to Twenty-One!"
puts

loop do
  system 'cls'
  curr_deck = init_deck
  player_hand = []
  dealer_hand = []
  2.times do 
    player_hand << deal_card!(curr_deck)
    dealer_hand << deal_card!(curr_deck)
  end

  show_dealer_hand(dealer_hand)
  show_player_hand(player_hand)
  
  hit_stay = ''

  until hit_stay == 'stay' || calc_win_lose(player_hand) != 0
    hit_stay = player_hit_or_stay
    player_hand << deal_card!(curr_deck) if hit_stay == 'hit'
    system 'cls'
    show_dealer_hand(dealer_hand)
    show_player_hand(player_hand)
    disp_player_win_lose(player_hand, dealer_hand)
  end
  dealer_hand = dealer_turn(curr_deck, dealer_hand, player_hand)

  puts "The deck size is: #{curr_deck.size}"

  system 'cls'
  show_dealer_hand(dealer_hand, true, true)
  show_player_hand(player_hand, true)

  disp_dealer_win_lose(dealer_hand, player_hand, true)
  disp_player_win_lose(player_hand, dealer_hand, true)

  
  prompt 'Do you want to play again? (y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
