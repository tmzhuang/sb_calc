require './fabricator_weapon'

module FabricatorWeaponsInitializer
  def self.included(base)
    class << base
      def add_fabricator_weapons_to(weapons)
        #dancers
        (1..6).each do |tier|
          tier == 6 ? min_base  = 3 : min_base  = 4
          max_base = 8
          min = calc_offset(base: min_base, offset: 3, tier: tier)
          max = calc_offset(base: max_base, offset: 3, tier: tier)
          weapon = FabricatorWeapon.new(min: min,
                                        max: max,
                                        fire_delay: 500,
                                        cycle: 150,
                                        duration: 1000)
          key = weapon_hash(:dancer, tier: tier)
          weapons[key] = weapon
        end

        #telson
        telson1  = weapon_hash(:telson, tier:1)
        weapon = FabricatorWeapon.new(min: 2,
                                      max: 4,
                                      fire_delay: 500,
                                      cycle: 350,
                                      duration: 1000,
                                      shots: 12)
        weapons[telson1] = weapon

        telson2  = weapon_hash(:telson, tier:2)
        weapon = FabricatorWeapon.new(min: 9,
                                      max: 13,
                                      fire_delay: 500,
                                      cycle: 350,
                                      duration: 1000,
                                      shots: 9)
        weapons[telson2] = weapon

        #trinity
        trinity1  = weapon_hash(:trinity, tier:1)
        weapon = FabricatorWeapon.new(min: 5,
                                      max: 9,
                                      fire_delay: 500,
                                      cycle: 150,
                                      duration: 1000,
                                      shots: 3)
        weapons[trinity1] = weapon

        trinity2  = weapon_hash(:trinity, tier:2)
        weapon = FabricatorWeapon.new(min: 8,
                                      max: 13,
                                      fire_delay: 500,
                                      cycle: 150,
                                      duration: 1000,
                                      shots: 4)
        weapons[trinity2] = weapon

        #quickstep
        quickstep  = weapon_hash(:quickstep, tier:1)
        weapon = FabricatorWeapon.new(min: 6,
                                      max: 12,
                                      fire_delay: 100,
                                      cycle: 150,
                                      duration: 500,
                                      shots: 1)
        weapons[quickstep] = weapon
      end
    end
  end
end
