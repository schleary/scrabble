class Scrabble

  def initialize
  end

  # returns the total score value for the given word (case insensitive)
  def self.score(word)
    word_score = 0
    word.each_char { |letter| word_score += get_letter_value(letter) }
    return word_score
  end

  # returns the score value for the given letter
  def self.get_letter_value(letter)
    if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].include?(letter)
      return 1
    elsif ['D', 'G'].include?(letter)
      return 2
    elsif ['B', 'C', 'M', 'P'].include?(letter)
      return 3
    elsif ['F', 'H', 'V', 'W', 'Y'].include?(letter)
      return 4
    elsif letter == 'K'
      return 5
    elsif ['J', 'X'].include?(letter)
      return 8
    elsif ['Q', 'Z'].include?(letter)
      return 10
    else
      return Argument Error 'Invalid Argument. Can only calculate values of letters.'
    end
  end

  # returns the word in the array with the highest score.
  def self.highest_score_from(array_of_words)
    score = 0
    winning_word = ""
    tie_array = []
    array_of_words.each do |word|
      amount = Scrabble.score(word)
      if amount == score
        tie_array << word
        winning_word = Scrabble.tie_breaker(tie_array)
      elsif amount > score
        score = amount
        winning_word = word
      end
    end
    return winning_word
  end

  # if the top score is tied between multiple words, pick the one with the fewest letters.
  def self.tie_breaker(array_of_tied_words)
    winning_word = array_of_tied_words[0]
    length = array_of_tied_words[0].length
    array_of_tied_words.each do |word|
      if word.length == 7
        return word
      elsif word.length < length
        length = word.length
        winning_word = word
      end
    end
    return winning_word
  end

#   # Count number of letters in word
#   def self.count_letters(word)
#     return word.length
#   end
#
# # If one of the highest scores uses all seven letters, pick that one (return true)
#   def self.compare_letter_count(quantity)
#     if quantity != 7
#       return false
#     else
#       return true
#     end
#   end

  # # If the there are multiple words that are the same score and same length, pick the first one in supplied list
  # def self.compare_words(array_of_words)
  #   winner = 0
  #   count = 0
  #   array_of_words.each do |word|
  #     score_count = word.length
  #     if score_count == count
  #       winner = Scrabble.tie_breaker(array_of_words)
  #     elsif score_count > count
  #       winner = word
  #       count = score_count
  #     end
  #   end
  #   return winner
  # end

end
