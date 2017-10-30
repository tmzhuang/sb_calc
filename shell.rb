require 'pry'
class Shell

  attr_accessor :crit_chance, :crit_dmg, :bonus_dmg, :weapon

  def initialize(crit_chance: 0, crit_dmg: 0, bonus_dmg: 0, weapon: nil)
    @crit_chance = crit_chance
    @crit_dmg = crit_dmg
    @bonus_dmg = bonus_dmg
    @weapon = weapon
  end

  def dps(armoured: false, period: 10000)
    (armoured && !@weapon.ap) ? armour_reduction = 0.5 : armour_reduction = 0
    @weapon.crit ? crit_bonus = 0.05 : crit_bonus = 0
    @weapon.critd ? critd_bonus = 2 : critd_bonus = 0
    crit = @crit_chance + crit_bonus
    critd = @crit_dmg + critd_bonus

    base_dmg = (1 + @bonus_dmg) * @weapon.dps(period: period) 
    crit_armor = (1 - crit) * (1 - armour_reduction) + crit * critd

    base_dmg * crit_armor / 10000.0
  end
end
