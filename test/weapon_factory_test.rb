require 'minitest/autorun'
require './weapon_factory'
require 'pry'

class WeaponFactoryTest < Minitest::Test
  def test_make_t3_dancer
    t3_dancer = WeaponFactory.make(:dancer, tier:3)
    assert_equal 10, t3_dancer.min
    assert_equal 14, t3_dancer.max
    assert_equal 1000, t3_dancer.duration
    assert_equal 150, t3_dancer.cycle
  end

  def test_make_t6_dancer
    t6_dancer = WeaponFactory.make(:dancer, tier:6)
    assert_equal 18, t6_dancer.min
    assert_equal 23, t6_dancer.max
    assert_equal 1000, t6_dancer.duration
    assert_equal 150, t6_dancer.cycle
  end

  def test_make_t1_trinity
    trinity = WeaponFactory.make(:trinity, tier:1)
    trinity.cycle = 50
    assert_equal 8400, trinity.dps
  end

  def test_make_t2_soidal
    soidal = WeaponFactory.make(:soidal, tier:2)
    soidal.shots = 2
    assert_equal 2800, soidal.dps
  end
end
