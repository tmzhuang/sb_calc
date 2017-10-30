require 'minitest/autorun'
require './shell'
require './fabricator_weapon'
require './weapon_factory'
require './weapon'
require 'pry'

class ShellTest < Minitest::Test
  def setup
    @delta = 0.5

    # Setup fab
    @trinity = FabricatorWeapon.new(min: 5, max: 9, shots:3, fire_delay:500, cycle:50, duration:1000)

    @perfqs = WeaponFactory.make(:quickstep, tier:1)
    @perfqs.cycle = 50
    @perfqs.crit = true
    @perfqs.critd = true

    @fabricator = Shell.new(crit_chance: 0.05,
                            crit_dmg: 3.8,
                            bonus_dmg: 0.4,
                            weapon: @trinity)

    # Setup wf
    @soidal = Weapon.new(min: 11, max: 17, shots:2, fire_delay:100)
    @wildfire = Shell.new(crit_chance: 0.05,
                            crit_dmg: 3,
                            bonus_dmg: 0.65,
                            weapon: @soidal)
  end

  def test_fab_trinity_dps
    assert_in_delta 1340.64, @fabricator.dps, @delta
  end

  def test_fab_trinity_armoured_dps
    assert_in_delta 782.04, @fabricator.dps(armoured:true), @delta
  end

  def test_fab_perfqs_dps
    @fabricator.weapon = @perfqs
    assert_in_delta 1864.8, @fabricator.dps.round, @delta
  end

  def test_fab_perfqs_armoured_dps
    @fabricator.weapon = @perfqs
    assert_in_delta 1297.8, @fabricator.dps(armoured:true), @delta
  end

  def test_wf_soidal_dps
    assert_in_delta 508.2, @wildfire.dps, @delta
  end

  def test_wf_soidal_armoured_dps
    assert_in_delta 288.75, @wildfire.dps(armoured:true), @delta
  end

  def test_wf_soidal_ap_armoured_dps
    @wildfire.weapon.ap = true
    assert_in_delta 508.2, @wildfire.dps(armoured:true), @delta
  end
end
