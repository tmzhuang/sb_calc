module DuskwingWeaponsInitializer
  def self.included(base)
    class << base
      def add_duskwing_weapons_to(weapons)
        # skeins
        (1..6).each do |tier|
          min_base = 15
          max_base = 30
          min = calc_offset(base: min_base, offset: 10, tier: tier)
          max = calc_offset(base: max_base, offset: 10, tier: tier)
          weapon = Weapon.new(min: min,
                              max: max,
                              fire_delay: 250)
          key = weapon_hash(:skein, tier: tier)
          weapons[key] = weapon
        end

        # polychrome
        polychrome = Weapon.new(min: 15,
                            max: 35,
                            shots: 3,
                            fire_delay: 400)
        key = weapon_hash(:polychrome, tier: 1)
        weapons[key] = polychrome

        motley = Weapon.new(min: 35,
                            max: 55,
                            shots: 3,
                            fire_delay: 400)
        key = weapon_hash(:polychrome, tier: 2)
        weapons[key] = motley
      end
    end
  end
end
