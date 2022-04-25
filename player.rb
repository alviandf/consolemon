require_relative 'monster'

class Player
  attr_reader :cards, :spell_cards

  def initialize(name)
    @name = name
    @cards = []
    @spell_cards = []
  end

  def add_monster(monster)
    cards << monster.dup
  end

  def add_spell_card(spell_card)
    spell_cards << spell_card.dup
  end

  def to_s
    result = "#{@name}:\n"

    @cards.each_with_index do |monster, index|
      result += monster.to_s
      if index < @cards.size - 1
        result += ', '
      else
        result += "\n"
      end
    end

    result
  end

  def play_turn(own_card, opponent_card, opponent)
    print "#{@name}'s "

    # Is this Polymorphism (?)
    @cards[own_card - 1].attack(opponent.cards[opponent_card - 1])
  end

  def apply_effects
    @cards.each do |card|
      if card.is_a? Monster
        card.apply_effect
      end
    end
  end
end
