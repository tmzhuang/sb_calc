class Weapon
  attr_accessor :min, :max, :fire_delay, :shots, :crit, :critd, :ap
  def initialize(min:, max:, fire_delay:, shots:1, crit: false, critd: false, ap: false)
    @min = min
    @max = max
    @fire_delay = fire_delay
    @shots = shots
    @crit = crit
    @critd = critd
    @ap = ap
  end

  def avg_dmg
    (@min + @max) / 2.0
  end

  def dmg_per_hit
    avg_dmg
  end

  def dps(period:10)
    period = period * 1000
    hits = (period / @fire_delay.to_f).ceil
    dmg_per_hit * hits * shots
  end

  def clone
    Weapon.new(min: @min,
               max: @max,
               fire_delay: @fire_delay,
               shots: @shots,
               crit: @crit,
               critd: @critd,
               ap: @ap)
  end
end
