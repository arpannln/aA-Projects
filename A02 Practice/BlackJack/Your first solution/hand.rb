require 'deck.rb'
require 'card.rb'
class Hand

  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    sorted = @cards.sort_by{|el| el.value}.reverse 
    p sorted 
    sorted.each_with_index do |card, idx| 
      if card.value == :ace 
        if (sum + 11 <= 21) && idx == sorted.length - 1 
          sum += 11
        else 
          sum += 1
        end 
        next 
      end 
      sum += card.blackjack_value
    end 
    sum 
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1) 
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if busted?
    return points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
