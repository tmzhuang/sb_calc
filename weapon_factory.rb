require './weapons_initializer_helper'
require './fabricator_weapons_initializer'
require './wildfire_weapons_initializer'
require './duskwing_weapons_initializer'

class WeaponFactory
  include WeaponsInitializerHelper
  include FabricatorWeaponsInitializer
  include WildfireWeaponsInitializer
  include DuskwingWeaponsInitializer
  @@weapons = {} 
  add_fabricator_weapons_to(@@weapons)
  add_wildfire_weapons_to(@@weapons)
  add_duskwing_weapons_to(@@weapons)

  class << self
    public
    def make(name, tier:)
      key = weapon_hash(name, tier: tier)
      @@weapons[key].clone
    end

    def weapons
      @@weapons
    end
  end
end

if __FILE__ == $0
  WeaponFactory.weapons.each do |name, weapon|
    puts "#{name} dps: #{weapon.dps}"
  end
end
