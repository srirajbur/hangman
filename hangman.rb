
class Hangman
  def self.random_word
    words = []
    lines = File.readlines('5desk.txt')
    lines.each { |word| words << word.strip }
    
    words.select! do |word|
      word.length.between?(5, 12)
    end
    
    return words.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.lenght, "_")
    @attempted_char = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted(char)
    @attempted_char.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each.with_index do |letter, idx|
      if char == letter
        indices << idx
      end
    end
  end

  def fill_indices(char, indices)
    indices.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if self.already_attempted(char)
      puts "Already been attempted"
      return false
    end

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
  end

  def ask_user_for_guess
    puts "Enter a char:"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "YOU WIN!"
      true 
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "YOU LOSE"
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
    puts @secret_word
    return true
  end
end