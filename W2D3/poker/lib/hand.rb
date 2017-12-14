require_relative 'card'
require_relative 'deck'

class Hand
  attr_reader :value, :cards, :highest_card, :frequency

  def initialize(cards)
    @cards = cards.sort_by { |el| el.value }

    @frequency = Hash.new(0)

    @cards.each do |card|
      @frequency[card.value] += 1
    end

  end

  def find_value

  end

  def royal_flush? #we really dont take care of aces anywhere
    straight_flush? && card[4].value == 13
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    frequency.value?(4)

  end

  def full_house?
    frequency.value?(2) && frequency.value?(3)

  end

  def flush?
    @cards.each_index do |idx|
      return true if idx == 4
      return false if cards[idx].suit != cards[idx+1].suit
    end
    true
  end

  def straight?

    @cards.each_index do |idx|
      return true if idx == 4
      return false if cards[idx].value+1 != cards[idx+1].value
    end
    true
  end

  def three_of_a_kind?

    (3..4).each do |num|
      return true if frequency.value?(num)
    end
    false

  end

  def two_pair?

    count = 0

    frequency.each_value do |num|
      count += 1 if num > 1
    end

    count == 2

  end

  def pair?
    (2..4).each do |num|
      return true if frequency.value?(num)
    end
    false
  end

  def high_card
    cards[4].value
  end


end

game = Deck.new
cards = []
5.times do
  cards << game.remove_card
end

hand = Hand.new(cards)

hand.cards.each do |card|
  card.value
end

p hand.frequency

p "Straight: #{hand.straight?}"
p "royal_flush?: #{hand.royal_flush?}"
p "straight_flush?: #{hand.straight_flush?}"
p "four_of_a_kind?: #{hand.four_of_a_kind?}"
p "full_house?: #{hand.full_house?}"
p "flush? #{hand.flush?}"
p "three_of_a_kind? #{hand.three_of_a_kind?}"
p "two_pair? #{hand.two_pair?}"
p "pair? #{hand.pair?}"
