require 'minitest/autorun'
require './weapon'

class WeaponTest < Minitest::Test
  def setup
      @soidal = Weapon.new(min: 11, max: 17, shots:2, fire_delay:100)
  end

  def test_soidal_dps
    assert_equal 2800, @soidal.dps
  end
end
