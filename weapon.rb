class Weapon
  attr_accessor :min, :max, :fire_delay, :shots, :crit, :critd, :ap
  def initialize(min:, max:, fire_delay:, shots:1, crit: false, critd: false, ap: false )
    @dmg = min..max
    @fire_delay = fire_delay
    @shots = shots
    @crit = crit
    @critd = critd
    @ap = ap
  end

  def avg_dmg
    (@dmg.min + @dmg.max) / 2
  end

  def dps(period:10)
    period = period * 1000
    hits = (period / @fire_delay).ceil
    avg_dmg * hits * shots
  end

end
