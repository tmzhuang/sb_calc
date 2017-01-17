require 'minitest/autorun'
require './fabricator_weapon'
require 'pry'

class WeaponTest < Minitest::Test
  def setup
      @trinity = FabricatorWeapon.new(min: 5, max: 9, shots:3, fire_delay:500, cycle:50, duration:1000)
  end

  def test_trinity_dps
    binding.pry
    assert_equal @trinity.dps, 20*21*20
  end
end
