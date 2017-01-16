class Shell
  attr_accessor :crit_chance, :crit_dmg, :bonus_dmg, :weapon

  def initialize(crit_chance: 0, crit_dmg: 0, bonus_dmg: 0, weapon: nil)
    @crit_chance = crit_chance
    @crit_dmg = crit_dmg
    @bonus_dmg = bonus_dmg
    @weapon = weapon
  end

  def dp10s(armoured: false)
    armour_reduction = 0
    armour_reduction = 0.5 if (armoured && weapon.mods.include?(:ap)) 
    return (1 - @crit_chance) * (1 + @bonus_dmg) * @weapon.dp10s * (1 - armour_reduction) + 
      @crit_chance * @crit_dmg * (1 + @bonus_dmg) * @weapon.dp10s
  end
end

if __FILE__ == $0
end
