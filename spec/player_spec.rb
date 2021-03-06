require './player.rb'

describe Player do
  player = Player.new("Holly")
  player2 = Player.new("Brad")

  # name returns the @name instance variable
  describe "#name" do
    it "creates a new instance w/ the instance variable assigned" do
      expect(player.name).to eq 'Holly'
    end
  end

  # total_score Adds and returns the total score of the players words
  describe "#total_score" do
    it "adds and returns the total score for the players words" do
      expect(player.total_score(['HILLY', 'FILLO', 'QUIZ', 'JACKPOT', 'HIJACK', 'JINXING'])).to eq 107
    end
    it "adds and returns the total score for the players words" do
      expect(player2.total_score(['FIRE', 'CARPET', 'ORANGE', 'THE', 'WIN', 'BUNGALO'])).to eq 46
    end
  end

  # won? If the player has over 100 points, returns true
  describe "#won?" do
    it "when player has over 100 pts" do
      expect(player.won?).to eq true
    end
    it "when player has over 100 pts" do
      expect(player2.won?).to eq false
    end
  end


  describe "#plays" do
    it "populates the #plays array" do
      expect(player2.play('FIRE')).to eq true
    end
    it "populates the #plays array" do
      expect(player2.play('ABORT')).to eq true
    end

    it "populates the #plays array" do
      expect(player.play('COOP')).to eq false
    end

  end

  describe "#play" do
    # Returns false if player has won
    it "returns false if the player has won" do
      expect(player2.plays).to eq ['FIRE', 'ABORT']
    end

    it "returns false if the player has won" do
      expect(player.plays).to eq []
    end
  end

end
