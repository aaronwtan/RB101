VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def player1_wins?(player1, player2)
  case player1
  when 'rock' then player2 == 'scissors'
  when 'paper' then player2 == 'rock'
  when 'scissors' then player2 == 'paper'
  end
end

def display_results(player, computer)
  if player1_wins?(player, computer)
    prompt("You win!")
  elsif player1_wins?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a draw!")
  end
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    if %w(y yes n no).include?(answer)
      return %w(y yes).include?(answer)
    else
      prompt("Invalid response. Please type y or n.")
    end
  end
end

loop do
  player_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp
    break if VALID_CHOICES.include?(player_choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{player_choice}; Computer chose #{computer_choice}.")
  display_results(player_choice, computer_choice)

  prompt("Do you want to play again?")
  break unless play_again?
end

prompt("Thank you for playing Rock, Paper, Scissors. Goodbye!")
