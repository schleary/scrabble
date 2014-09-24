class Player

  attr_accessor :name, :score, :plays  #use your array of words

  def initialize(name)
    @name = name
    @plays = []
  end

   # returns the total score value for the given word (case insensitive)
  def self.score(word)
    word_score = 0
    word.each_char { |letter| word_score += get_letter_value(letter) }
    return word_score
  end

  def total_score(word_array)
    total = 0
    word_array.each do |word|
      total += Scrabble.score(word)
    end
    @score = total
  end

  def won?
    if @score > 100
      return true
    else
      return false
    end
  end

  def play(word)
    puts "WELL?"
    if won? == true
      return false
    else
      puts "HERE?"
      @plays << word
    end
    return true
  end

end
