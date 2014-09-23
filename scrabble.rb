class Scrabble

  def initialize
  end

  # returns the total score value for the given word (case insensitive)
  def self.score(word)
    word_score = 0
    word.each_char do |letter|
      word_score += get_letter_value(letter)
    end
    return word_score
  end

  # returns the score value for the given letter
  def self.get_letter_value(letter)
    if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].include?(letter)
      return 1.to_i
    elsif ['D', 'G'].include?(letter)
      return 2.to_i
    elsif ['B', 'C', 'M', 'P'].include?(letter)
      return 3.to_i
    elsif ['F', 'H', 'V', 'W', 'Y'].include?(letter)
      return 4.to_i
    elsif letter == 'K'
      return 5.to_i
    elsif ['J', 'X'].include?(letter)
      return 8.to_i
    elsif ['Q', 'Z'].include?(letter)
      return 10.to_i
    end
  end

  # returns the word in the array with the highest score.
  def self.highest_score_from(array_of_words)
    #heirarchy
    #highest score
    #all seven letters
    #fewest letters
    #first
    score = 0
    winning_word = nil
    array_of_words.each do |word|
      amount = Scrabble.score(word)
      if amount == score

        winning_word = Scrabble.tie_breaker(array_of_words)
      elsif amount > score
        score = amount
        winning_word = word
      end
    end
    return winning_word
  end

  # if the top score is tied between multiple words, pick the one with the fewest letters.
  def self.tie_breaker(array_of_words)
    length = array_of_words[0].length
    winning_word = array_of_words[0]
    array_of_words.each do |word|
      if word.length == 7
        winning_word = word
      elsif word.length == length
        winning_word = smallest_word
      elsif  word.length < length   #redundant
        puts "smallest word: #{smallest_word}"
        length = word.length
        winning_word = word
      end
    end
    return winning_word
  end

  # Count number of letters in word
  def self.count_letters(word)
    return word.length
  end

# If one of the highest scores uses all seven letters, pick that one (return true)
  def self.compare_letter_count(quantity)
    if quantity != 7
      return false
    else
      return true
    end
  end

  # If the there are multiple words that are the same score and same length, pick the first one in supplied list
  def self.compare_words(array_of_words)
    winner = 0
    count = 0
    array_of_words.each do |word|
      score_count = Scrabble.count_letters(word)
      if score_count == count
        winner = Scrabble.tie_breaker(array_of_words)
      elsif score_count > count
        winner = word
        count = score_count
      end
    end
    return winner
  end




end
