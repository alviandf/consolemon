class SpellCard
  def initialize(name, type)
    @name = name
    @type = type
  end

  def attack(monster)
    if @name == 'Flamethrower'
      if monster.status[:name]
        monster.edit_turn_elemental_attack(monster.status[:turn_remaining] + 1)
        puts "casts #{@name} spell on enemy's #{monster.name}"
      end
    end
  end

  def to_s
    "#{@name}[#{@type}]"
  end

end