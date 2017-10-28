require 'pry'

WIN_ARRAY = [[1, 2, 3], [1, 4, 7], [1, 5, 9]] + 
            [[2, 5, 8], [3, 5, 7], [3, 6, 9]] + 
            [[4, 5, 6], [7, 8, 9]]


def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delim, word)
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else 
    new_arr = arr.map {|item| item.to_s}
    new_arr.last.prepend(word + ' ')
    new_arr.join(delim)
  end
end

def display_game_score(game, p_score, c_score)
  puts "Game #{game} \n"
  puts "Your Score: #{p_score}, Computer Score: #{c_score}"
end

def display_board(move_array)
  system 'cls'
  move_array.each_with_index do |sub_arr, i|
    puts '     |     |'
    puts "  #{sub_arr[0]}  |  #{sub_arr[1]}  |  #{sub_arr[2]}"
    puts '     |     |'
    puts '-----+-----+-----' unless i == 2
  end
  puts
end

def update_board(move_array, move, play_turn)
  game_sym = play_turn == 1 ? 'X' : 'O'

  move_array.map do |sub_arr|
    sub_arr.map do |position|
      position == move ? position = game_sym : position
    end
  end
end

def set_player
  prompt 'Do you want to be: '
  prompt "1: X's (go 1st)"
  prompt "2: O's (go 2nd)"
  prompt "3: Randomly choose"
  ans = 0
  loop do
    ans = gets.chomp
    break unless !((1..3).include?(ans.to_i))
    prompt 'That was not a valid response.'
  end

  plyr = 0
  case ans.to_i
  when 1 then plyr = 1
  when 2 then plyr = 2
  when 3 then plyr = rand(1) + 1
  end 
  plyr
end

def player_make_move(move_array)
  prompt 'Please select your move: '
  move = 0
  loop do
    move = gets.chomp
    break unless validate_input(move_array, move).zero?
    prompt 'That was not a valid square, please try again'
  end
  move
end

def alternate_player(plyr, trn, move_array)
  move = 0
  if (plyr == 1 && trn == 1) || (plyr == 2 && trn == 2)
    move = player_make_move(move_array)
  else
    move = comp_move(move_array)
  end
  move
end

def empty_spaces(move_array)
  move_array.flatten.delete_if do |position|
    position == 'X' || position == 'O'
  end
end

def x_positions(move_array)
  x_positions = []

  move_array.flatten.each_with_index do |position, i|
    x_positions << (i + 1) if position == 'X'
  end

  x_positions
end

def o_positions(move_array)
  o_positions = []

  move_array.flatten.each_with_index do |position, i|
    o_positions << (i + 1) if position == 'O'
  end

  o_positions
end

def comp_move(move_array)
  move = 0

  x_pos = x_positions(move_array)
  o_pos = o_positions(move_array)

# Choose a Win if available

  WIN_ARRAY.each do |win|
    if (win - o_pos).size == 1
      move = (win - o_pos).first unless (win - o_pos - x_pos).size == 0
      break if !move.zero?
    end
  end

# Defend Immediate Threats
  
  if move.zero?
    WIN_ARRAY.each do |win|
      if (win - x_pos).size == 1
        move = (win - x_pos).first unless (win - x_pos - o_pos).size == 0
        break if !move.zero?
      end
    end
  end

  if move.zero? && move_array.flatten.include?('5')
    move = '5'
  elsif move.zero?
    move = empty_spaces(move_array).sample
  end

  move.to_s
end

def validate_input(move_array, move)
  move_array.flatten.include?(move) ? (return 1) : (return 0)
end

def check_win(move_array)
  # X wins: 1, O wins: 2, Tie: 3, No decision: 0

  x_pos = x_positions(move_array)
  o_pos = o_positions(move_array)

  WIN_ARRAY.each do |win|
    return 1 if (win - x_pos).empty?
    return 2 if (win - o_pos).empty?
  end

  (return 3) if x_pos.size + o_pos.size == 9
  0
end

prompt 'Welcome to Tic-Tac-Toe!'

loop do
  win_condition = 0
  player = set_player
  player == 1 ? computer = 2 : computer = 1
  player_score = 0
  computer_score = 0
  game_counter = 0

  while player_score < 5 && computer_score < 5
    game_counter += 1
    current_board = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
    display_board(current_board)
    turn = 1
    while win_condition.zero?
      display_game_score(game_counter, player_score, computer_score)
      current_move = alternate_player(player, turn, current_board)
      current_board = update_board(current_board, current_move, turn)
      display_board(current_board)
      win_condition = check_win(current_board)
      break unless win_condition.zero?
      turn == 1 ? turn = 2 : turn = 1
    end
    
    system 'cls'
    display_board(current_board)

    case win_condition
    when 1
      prompt 'You won!'
      player == 1 ? player_score += 1 : computer_score += 1
    when 2
      prompt 'The computer won!'
      computer == 2 ? computer_score += 1 : player_score += 1
    when 3
      prompt "It's a tie!"
    end
    win_condition = 0 

  end

  display_game_score(game_counter, player_score, computer_score)

  puts
  prompt 'Do you want to play again? (y/n)'
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

puts
prompt 'Thanks for playing!'