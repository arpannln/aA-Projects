require_relative 'card'

class Deck
  attr_reader :deck

  def self.make_deck
    result = []

    (1..13).each do |value|
      result << Card.new("heart", "red", value)
      result << Card.new("spade", "black", value)
      result << Card.new("club", "black", value)
      result << Card.new("diamond", "red", value)
    end

    result.shuffle


  end

  def initialize

    @deck = Deck.make_deck
  end

  def remove_card
    @deck.pop
  end

  def shuffle
    @deck = @deck.shuffle
  end

end
