# Variation on classic game of Rock Paper Scissors
# with added Lizard and Spock options.
# First to 3 wins. Players can be human, computer, or both

require 'yaml'
MESSAGES = YAML.load_file('rpsls.yml')

CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
ABBREVIATIONS = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  l: 'lizard',
                  sp: 'spock' }
WIN_CONDITIONS = { rock: ['scissors', 'lizard'],
                   paper: ['rock', 'spock'],
                   scissors: ['paper', 'lizard'],
                   lizard: ['paper', 'spock'],
                   spock: ['rock', 'scissors'] }
COMPUTER_PLAYER = ['computer', 'computer 1', 'computer 2']

def prompt(message)
  if MESSAGES.key?(message)
    puts "=> #{MESSAGES[message]}"
  else
    puts "=> #{message}"
  end
end

def display_welcome
  system('clear')
  prompt('welcome')
  loading
end

def display_rules
  prompt('rules')
  loading
end

def display_continue
  prompt('continue')
  gets
end

def display_greeting(player, player_number)
  if player.downcase == 'computer'
    prompt("The computer will play as Player #{player_number}.")
  else
    prompt("Hello #{player}! You will play as Player #{player_number}.")
  end
  loading
end

def loading
  sleep(2.5)
end

def display_grand_winner_condition(grand_winner_score)
  prompt("First to #{grand_winner_score} wins! Let's get ready to play...")
  loading
end

def display_game_state(player1, player2, round, score)
  system('clear')
  display_round(round)
  display_score(player1, player2, score)
  loading
end

def display_round(round)
  display_border("ROUND #{round}")
end

def display_score(player1, player2, score)
  prompt("#{player1}: #{score[0]}")
  prompt("#{player2}: #{score[1]}")
end

def display_border(border_message)
  border = '-' * border_message.length
  prompt(border)
  prompt(border_message)
  prompt(border)
end

def display_choices(player1, player1_choice, player2, player2_choice)
  prompt("#{player1} chose #{player1_choice}; "\
         "#{player2} chose #{player2_choice}.")
  loading
end

def display_computer_choosing(computer)
  prompt("#{computer} is choosing...")
  loading
end

def display_results(player1, player1_choice, player2, player2_choice)
  if player1_wins?(player1_choice, player2_choice)
    prompt("#{player1} wins!")
  elsif player1_wins?(player2_choice, player1_choice)
    prompt("#{player2} wins!")
  else
    prompt('draw')
  end
  loading
end

def display_grand_winner(grand_winner)
  if grand_winner.downcase == "computer"
    display_border(MESSAGES['computer_won'])
  else
    display_border("Congratulations! #{grand_winner} is the Grand Winner!")
  end
end

def display_goodbye
  prompt('goodbye')
end

# ask if player is a human or computer; if human, ask their name
# return name if human; else return computer
def ask_player(player_number)
  system('clear')

  prompt("Is player #{player_number} a human or computer?")
  human? ? ask_name : 'Computer'
end

def human?
  loop do
    answer = gets.chomp.downcase
    return answer == 'human' if ['human', 'computer'].include?(answer)

    prompt('invalid_human_or_computer')
  end
end

def ask_name
  prompt('ask_name')
  loop do
    name = gets.chomp
    if name.strip.empty?
      prompt('invalid_name')
    elsif name.downcase == 'computer'
      prompt('computer_name')
    else
      return name
    end
  end
end

def ask_grand_winner_score
  loading
  system('clear')

  prompt('grand_winner_score')
  loop do
    grand_winner_score = gets.chomp
    if valid_number?(grand_winner_score)
      return grand_winner_score.to_i
    elsif grand_winner_score.empty?
      return 3
    else
      prompt('invalid_number')
    end
  end
end

def ask_player_choice(player)
  if COMPUTER_PLAYER.include?(player.downcase)
    display_computer_choosing(player)
    computer_choice
  else
    ask_human_choice(player)
  end
end

def ask_human_choice(player)
  loop do
    prompt("#{player}, please choose one: #{CHOICES.join(', ')} ")
    player_choice = gets.chomp.downcase

    if CHOICES.include?(player_choice)
      return player_choice
    else
      player_choice = expand_abbreviation(player_choice)
      return player_choice if !player_choice.nil?
      prompt('invalid_choice')
    end
  end
end

def expand_abbreviation(abbreviation)
  if abbreviation == 's'
    ask_scissors_or_spock
  else
    ABBREVIATIONS[abbreviation.to_sym]
  end
end

def ask_scissors_or_spock
  prompt('scissors_or_spock')
  loop do
    choice = gets.chomp.downcase
    if ['scissors', 'sc'].include?(choice)
      return 'scissors'
    elsif ['spock', 'sp'].include?(choice)
      return 'spock'
    else
      prompt('invalid_scissors_or_spock')
    end
  end
end

def computer_choice
  CHOICES.sample
end

def initialize_game
  player1_score = 0
  player2_score = 0
  score = [player1_score, player2_score]
  round = 1
  grand_winner = ''
  [round, score, grand_winner]
end

def update_duplicate_names!(player1, player2)
  if player1 == player2
    player1 << ' 1'
    player2 << ' 2'
  end
end

def update_score!(player1_choice, player2_choice, score)
  if player1_wins?(player1_choice, player2_choice)
    score[0] += 1
  elsif player1_wins?(player2_choice, player1_choice)
    score[1] += 1
  end
end

def grand_winner?(score, grand_winner_score)
  score.any? { |player_score| player_score == grand_winner_score }
end

def determine_grand_winner(player1, player2, score, grand_winner_score)
  if score[0] == grand_winner_score
    grand_winner = player1
  elsif score[1] == grand_winner_score
    grand_winner = player2
  end
  grand_winner
end

def valid_number?(number_str)
  number_str =~ /^\d+$/ && number_str.to_i > 0
end

def player1_wins?(player1_choice, player2_choice)
  WIN_CONDITIONS[player1_choice.to_sym].include?(player2_choice)
end

def play_again?
  prompt('play_again')
  loop do
    answer = gets.chomp.downcase
    if %w(y yes n no).include?(answer)
      return %w(y yes).include?(answer)
    else
      prompt('invalid_play_again')
    end
  end
end

# MAIN PROGRAM
loop do
  display_welcome
  display_rules
  display_continue

  player1 = ask_player(1)
  display_greeting(player1, 1)

  player2 = ask_player(2)
  display_greeting(player2, 2)

  update_duplicate_names!(player1, player2)

  grand_winner_score = ask_grand_winner_score
  display_grand_winner_condition(grand_winner_score)

  round, score, grand_winner = initialize_game

  loop do
    display_game_state(player1, player2, round, score)

    player1_choice = ask_player_choice(player1)
    player2_choice = ask_player_choice(player2)
    display_choices(player1, player1_choice, player2, player2_choice)

    display_results(player1, player1_choice, player2, player2_choice)
    update_score!(player1_choice, player2_choice, score)

    break if grand_winner?(score, grand_winner_score)

    round += 1
  end

  display_game_state(player1, player2, round, score)
  grand_winner = determine_grand_winner(player1, player2,
                                          score, grand_winner_score)
  display_grand_winner(grand_winner)

  break unless play_again?
end

display_goodbye
