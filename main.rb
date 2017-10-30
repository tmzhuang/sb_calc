require './shell'
require './weapon_factory'


def print_dps(shell, name)
  # Fab weapons
  perf_gav = WeaponFactory.make(:telson, tier:2)
  perf_gav.cycle = 300
  perf_gav.shots = 13

  perf_trin = WeaponFactory.make(:trinity, tier:1)
  perf_trin.cycle = 50
  perf_trin.shots = 5

  perf_qs = WeaponFactory.make(:quickstep, tier:1)
  perf_qs.cycle = 50
  perf_qs.crit = true
  perf_qs.critd = true

  perf_dancer = WeaponFactory.make(:dancer, tier:6)
  perf_dancer.cycle = 50
  perf_dancer.crit = true
  perf_dancer.critd = true

  t6dancer = WeaponFactory.make(:dancer, tier:6)
  t6dancer.cycle = 50

  trin100ct5d = WeaponFactory.make(:trinity, tier:1)
  trin100ct5d.cycle = 100
  trin100ct5d.shots = 5

  trin100ct4d = WeaponFactory.make(:trinity, tier:1)
  trin100ct4d.cycle = 100
  trin100ct4d.shots = 4

  stockvolta = WeaponFactory.make(:trinity, tier:2)

  gav250ct11d = WeaponFactory.make(:telson, tier:2)
  gav250ct11d.cycle = 250
  gav250ct11d.shots = 11
  
  # WF weapons
  perf_soidal = WeaponFactory.make(:soidal, tier:2)
  perf_soidal.shots = 2
  perf_soidal.ap = true

  bt = WeaponFactory.make(:boltthrower, tier:1)
  bt.fire_delay = 300

  jansky = WeaponFactory.make(:soidal, tier:1)
  jansky.shots = 2

  soidal = WeaponFactory.make(:soidal, tier:2)

  bow = WeaponFactory.make(:bow, tier:1)
  stonebow = WeaponFactory.make(:bow, tier:2)

  repeater = WeaponFactory.make(:repeater, tier:2)
  repeater.shots = 3

  bombard = WeaponFactory.make(:shotgun, tier:4)
  bombard.shots = 12

  # DW weapons
  perf_poly = WeaponFactory.make(:polychrome, tier:1)
  perf_poly.fire_delay = 300
  perf_poly.crit = true
  perf_poly.critd = true

  perf_motley = WeaponFactory.make(:polychrome, tier:2)
  perf_motley.fire_delay = 300
  perf_motley.crit = true
  perf_motley.critd = true

  perf_skein = WeaponFactory.make(:skein, tier:6)
  perf_skein.fire_delay = 300
  perf_skein.crit = true
  perf_skein.critd = true
  perf_skein.shots = 1

  weapon = eval(name)
  shell.weapon = weapon
  puts "#{name} dps: #{shell.dps.round}"
  puts "#{name} armoured dps: #{shell.dps(armoured: true).round}"
  puts
end

def print_dps_for(shell, weapon_names)
  weapon_names.each do |weapon_name|
    print_dps(shell, weapon_name)
  end
end

def print_fab_info
  fabricator = Shell.new(crit_chance: 0.105,
                         crit_dmg: 4.4,
                         bonus_dmg: 0.44)

  weapon_names = []
  weapon_names << "t6dancer"
  weapon_names << "trin100ct5d"
  weapon_names << "trin100ct4d"
  weapon_names << "gav250ct11d"
  weapon_names << "perf_trin"
  weapon_names << "perf_gav"
  weapon_names << "perf_qs"
  weapon_names << "perf_dancer"
  weapon_names << "stockvolta"

  print_dps_for(fabricator, weapon_names)
end

def print_wf_info
  wildfire = Shell.new(crit_chance: 0.05,
                       crit_dmg: 3,
                       bonus_dmg: 0.45)

  weapon_names = []
  weapon_names << "perf_soidal"
  weapon_names << "bt"
  weapon_names << "jansky"
  weapon_names << "soidal"
  weapon_names << "bow"
  weapon_names << "stonebow" 
  weapon_names << "repeater"
  weapon_names << "bombard"

  print_dps_for(wildfire, weapon_names)
end

def print_dw_info
  duskwing = Shell.new(crit_chance: 0.13,
                       crit_dmg: 4.6,
                       bonus_dmg: 0.40)

  weapon_names = []
  weapon_names << "perf_skein" 
  weapon_names << "perf_motley" 
  weapon_names << "perf_poly" 
  weapon_names << "bow" 
  weapon_names << "stonebow" 

  print_dps_for(duskwing, weapon_names)

end

if __FILE__ == $0
  print_wf_info
  puts
  print_fab_info
  puts
  print_dw_info
end
