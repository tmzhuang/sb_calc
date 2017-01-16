class FabricatorWeapon < Weapon
  attr_accessor :cycle, :duration
  def initialize(min:, max:, firerate:, shots:1, crit: false, critd: false, ap: false, cycle:, duration:)
    super(min, max, firerate, shots, crit, critd, ap)
    @cycle = cycle
    @duration = duration
  end

  def hits
    (duration/cycle).ceil
  end

  def dps
end
