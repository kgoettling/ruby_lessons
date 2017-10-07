CHOICE_NAMES = %w(rock paper scissors lizard spock)
VALID_CHOICES = %w(r p sc l sp)

game_names = {'r'=>'rock', 'p'=>'paper', 'sc'=>'scissors',
              'l'=>'lizard', 'sp'=>'spock'}
player_score = 0
comp_score = 0

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'r' && second == 'sc') || (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'r') ||(first == 'p' && second == 'sp') ||
    (first == 'sc' && second == 'p') || (first == 'sc' && second == 'l')  ||
    (first == 'l' && second == 'sp') || (first == 'l' && second == 'p') ||
    (first == 'sp' && second == 'r') || (first == 'sp' && second == 'sc') 
end

def results(player, computer)
  (return 'You win!') if win?(player, computer)
  win?(computer, player) ? (return 'Computer wins!') : (return "It's a tie!")
end

loop do
  choice = ''
  comp_choice = ''

  loop do
    prompt "Choose one: #{CHOICE_NAMES.join(', ')} (#{VALID_CHOICES.join(', ')})"
    choice = gets.chomp
    comp_choice = VALID_CHOICES.sample
    VALID_CHOICES.include?(choice) ? break : prompt("That's not a valid choice")
  end

  prompt "You chose: #{game_names[choice]}; Computer chose: #{game_names[comp_choice]}"
  curr_result = results(choice, comp_choice)
  comp_score += 1 if curr_result == 'Computer wins!'
  player_score += 1 if curr_result == 'You win!'
  prompt "#{curr_result} Your score: #{player_score}, Computer score: #{comp_score}"
  break if (comp_score == 5 || player_score == 5)
end

comp_score == 5 ? prompt('The computer wins the match!') : prompt('You won the match!')
prompt "Thanks for playing!"