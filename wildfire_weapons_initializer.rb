module WildfireWeaponsInitializer
  def self.included(base)
    class << base
      def add_wildfire_weapons_to(weapons)
        #repeaters
        (1..5).each do |tier|
          min_base = 6
          max_base = 8
          min = calc_offset(base: min_base, offset: 2, tier: tier)
          max = calc_offset(base: max_base, offset: 2, tier: tier)
          weapon = Weapon.new(min: min,
                              max: max,
                              fire_delay: 100)
          key = weapon_hash(:repeater, tier: tier)
          weapons[key] = weapon
        end

        #shotguns
        (1..4).each do |tier|
          tier == 1 ? min_base = 6 : min_base = 4
          tier == 1 ? max_base = 12 : max_base = 14
          tier == 4 ? shots_base = 4: shots_base = 5
          min = calc_offset(base: min_base, offset: 2, tier: tier)
          max = calc_offset(base: max_base, offset: 2, tier: tier)
          shots = calc_offset(base: shots_base, offset: 1, tier: tier)
          weapon = Weapon.new(min: min,
                              max: max,
                              shots: shots,
                              fire_delay: 400)
          key = weapon_hash(:shotgun, tier: tier)
          weapons[key] = weapon
        end

        #bows
        needlebow = Weapon.new(min: 100,
                            max: 200,
                            fire_delay: 750)
        key = weapon_hash(:bow, tier: 1)
        weapons[key] = needlebow

        stonebow = Weapon.new(min: 140,
                            max: 240,
                            fire_delay: 750)
        key = weapon_hash(:bow, tier: 2)
        weapons[key] = stonebow

        #soidals
        janksy = Weapon.new(min: 6,
                            max: 12,
                            fire_delay: 100)
        key = weapon_hash(:soidal, tier: 1)
        weapons[key] = janksy

        soidal = Weapon.new(min: 11,
                            max: 17,
                            fire_delay: 100)
        key = weapon_hash(:soidal, tier: 2)
        weapons[key] = soidal

        #boltthrower
        bolt_thrower = Weapon.new(min: 50,
                            max: 70,
                            fire_delay: 400)
        key = weapon_hash(:boltthrower, tier: 1)
        weapons[key] = bolt_thrower
      end
    end
  end
end
