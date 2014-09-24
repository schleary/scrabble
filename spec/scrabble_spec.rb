require './scrabble.rb'

describe Scrabble do

  # check letter values
  describe "#self.get_letter_value" do
    # checks that letters return values
    it "when word value is'Q'" do
      expect(Scrabble.get_letter_value("Q")).to eq 10
    end
    # raises exception if non-alpha symbol is entered
    it "raises ArgumentError exception" do
      expect{Scrabble.get_letter_value('&')}.to raise_error(NoMethodError)
    end
    # raises exception if no character is entered
    it "raises ArgumentError exception" do
      expect{Scrabble.get_letter_value(' ')}.to raise_error(NoMethodError)
    end
  end

  # self.score(word) returns the total score value for the given word (case insensitive)
  describe "#self.score" do
    it "returns a value for the word ('PURPLE')" do
      expect(Scrabble.score("PURPLE")).to eq 10
    end
  end

  # if the top score is tied between multiple words, brea
  describe "#self.tie_breaker" do
    # breaks a tie between words with different letter-counts
    it "returns the word with fewer letters" do
      expect(Scrabble.tie_breaker(['QUIZ', 'HIJACK'])).to eq 'QUIZ'
    end
    # breaks a tie between words when one uses 7 letters
    it "returns the word with 7 letters" do
      expect(Scrabble.tie_breaker(['QUIZ', 'JACKPOT'])).to eq 'JACKPOT'
    end
    # breaks a tie between words that are equivalent in terms of length and score
    it "if otherwise equivalent, returns the first word" do
      expect(Scrabble.tie_breaker(['JINXING', 'JACKPOT'])).to eq 'JINXING'
    end
  end

  #gets the highest score for a variety of situations
  describe "#highest_score_from" do
    it "when array of words is passed in" do
      expect(Scrabble.highest_score_from(['HILLY', 'FILLO', 'QUIZ', 'JACKPOT', 'HIJACK', 'JINXING'])).to eq 'JACKPOT'
    end
  end

end
