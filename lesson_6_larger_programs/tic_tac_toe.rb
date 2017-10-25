def prompt(msg)
  puts "=> #{msg}"
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

def comp_move(move_array)
  sample_array = move_array.flatten.delete_if do |position|
    position == 'X' || position == 'O'
  end
  sample_array.sample
end

def validate_input(move_array, move)
  move_array.flatten.include?(move) ? (return 1) : (return 0)
end

def check_win(move_array)
  # X wins: 1, O wins: 2, Tie: 3, No decision: 0

  win_array = [[1, 2, 3], [1, 4, 7], [1, 5, 9]] + 
              [[2, 5, 8], [3, 5, 7], [3, 6, 9]] + 
              [[4, 5, 6], [7, 8, 9]]
  x_positions = []
  o_positions = []

  move_array.flatten.each_with_index do |position, i|
    x_positions << (i + 1) if position == 'X'
    o_positions << (i + 1) if position == 'O'
  end

  win_array.each do |win|
    return 1 if (win - x_positions).empty?
    return 2 if (win - o_positions).empty?
  end

  (return 3) if x_positions.size + o_positions.size == 9
  0
end

prompt 'Welcome to Tic-Tac-Toe!'

loop do
  current_board = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
  display_board(current_board)

  win_condition = 0
  player = 1
  computer = 2

  while win_condition.zero?
    prompt 'Please select your move: '
    player_move = gets.chomp
    if validate_input(current_board, player_move).zero?
      prompt 'That was not a valid square, please try again'
      next
    end
    current_board = update_board(current_board, player_move, player)
    display_board(current_board)
    win_condition = check_win(current_board)
    break unless win_condition.zero?

    computer_play = comp_move(current_board)
    current_board = update_board(current_board, computer_play, computer)
    display_board(current_board)
    win_condition = check_win(current_board)
  end

  case win_condition
  when 1
    prompt 'You win!'
  when 2
    prompt 'The computer wins!'
  when 3
    prompt "It's a tie!"
  end

  puts
  prompt 'Do you want to play again? (y/n)'
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

puts
prompt 'Thanks for playing!'