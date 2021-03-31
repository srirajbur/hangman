require_relative 'hangman'

hangman = Hangman.new

until hangman.game_over? do
  puts "Icorrect guesses remaning: #{hangman.remaining_incorrect_guesses}"
  puts "Attempted Chars: #{hangman.attempted_char}"
  puts "Word: #{hangman.guess_word}"
  hangman.ask_user_for_guess
  print "\n\n"
end