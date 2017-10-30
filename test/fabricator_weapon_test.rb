require 'minitest/autorun'
require './fabricator_weapon'
require 'pry'

class FabricatorWeaponTest < Minitest::Test
  def setup
      @trinity = FabricatorWeapon.new(min: 5, max: 9, shots:3, fire_delay:500, cycle:50, duration:1000)
  end

  def test_trinity_dps
    assert_equal 20*21*20, @trinity.dps
  end
end
