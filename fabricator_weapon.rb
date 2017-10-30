require './weapon'
class FabricatorWeapon < Weapon
  attr_accessor :cycle, :duration
  def initialize(min:, max:, fire_delay:, shots:1, crit: false, critd: false, ap: false, cycle:, duration:)
    super(min: min, max: max, fire_delay: fire_delay, shots: shots, crit: crit, critd: critd, ap: ap)
    @cycle = cycle
    @duration = duration
  end

  def dmg_per_hit
    dances_per_hit = (@duration / @cycle.to_f).ceil
    avg_dmg * dances_per_hit
  end

  def clone
    FabricatorWeapon.new(min: @min,
                         max: @max,
                         fire_delay: @fire_delay,
                         shots: @shots,
                         crit: @crit,
                         critd: @critd,
                         ap: @ap,
                         cycle: @cycle,
                         duration: @duration)
  end
end
