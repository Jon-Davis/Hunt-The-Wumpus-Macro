;Races
HUMAN := {STR: 12, CON: 12, INT: 10, NAME: "human"}
ELF := {STR: 10, CON: 10, INT: 14, NAME: "elf"}
DWARF := {STR: 12, CON: 14, INT: 8, NAME: "dwarf"}
MONSTER := {STR: 12, CON: 14, INT: 8, NAME: "monster"}

;Classes
FIGHTER := {AttackStat: "STR", Armor: 6, NAME: "fighter"}
RANGER := {AttackStat: "STR", Armor: 4, NAME: "ranger"}
MAGE := {AttackStat: "INT",  Armor: 2, NAME: "mage"}
MONSTER := {AttackStat: "STR", Armor: 6, NAME: "monster"}

MeleeWeapons := {type: "weapon", starting: "dagger", bad: "shortsword", fine: "spear", good: "longsword", amazing: "Dragon Sword"}
RangeWeapons := {type: "weapon", starting: "blowgun", bad: "shortbow", fine: "crossbow", good: "longbow", amazing: "Magic bow"}
Spells := {type: "spell", starting: "frost", bad: "firebolt", fine: "earth shake", good: "magic missile", amazing: "Fireball"}
MonsterWeapons := {type: "attack", starting: "claw", bad: "pounce", fine: "charge", good: "bite", amazing: "savage strike"}

;Armor
none := {armor: 5, NAME: "no", type: 0, level: 0}
light := {armor: 6, NAME: "leather", type: 1, level: 1}
goodLight := {armor: 7, NAME: "boiled leather", type: 1, level: 2}
medium := {armor: 8, NAME: "chain shirt", type: 2, level: 3}
goodMedium := {armor: 9, NAME: "breast plate", type: 2, level: 4}
heavy := {armor: 10, NAME: "full suit", type: 3, level: 5}
goodHeavy := {armor: 11, NAME: "dragon bone", type: 3, level: 6}

;Weapons
starting := {chance: 5, damage: 4, level: 0}
bad := {chance: 4, damage: 6, level: 1}
fine := {chance: 3, damage: 8, level: 2}
good := {chance: 2, damage: 10, level: 3}
amazing := {chance: 1, damage: 12, level: 4}

startingInventory := {Weapon: 0, WeaponType: MeleeWeapons, Armor: none}
PLAYER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, armor: none, inventory: startingInventory}
CHALLENGER :=

^!n::
  Clipboard = Champion, you have been selected to take part in a battle Royal! first pick your race: HUMAN, ELF, or DWARF. Then select a class FIGHTER, RANGER, or MAGE!
  Send ^v

^!0::
  Run games.ahk
  ExitApp

!^h::
  PLAYER.race := HUMAN
  PLAYER.health := level * HUMAN.CON
Return

!^e::
  PLAYER.race := ELF
  PLAYER.health := level * ELF.CON
Return

!^d::
  PLAYER.race := DWARF
  PLAYER.health := level * DWARF.CON
Return

!^f::
  PLAYER.class := FIGHTER
  PLAYER.inventory.WeaponType := MeleeWeapons
Return

!^r::
  PLAYER.class := RANGER
  PLAYER.inventory.WeaponType := RangeWeapons
Return

!^m::
  PLAYER.class := MAGE
  PLAYER.inventory.WeaponType := Spells
Return

!^c::
  class := PLAYER.class.NAME
  race := PLAYER.race.NAME
  level := PLAYER.level
  health := PLAYER.health
  type := PLAYER.inventory.WeaponType.type
  weapons := weaponsOf(PLAYER,starting,bad,fine,good,amazing)
  armor := PLAYER.inventory.armor.NAME
  Clipboard = You are a level %level% %race% %class% with %health% health. you have the following %type%s %weapons% and %armor% armor.
  Send ^v
Return

weaponsOf(PLAYER,starting,bad,fine,good,amazing){
  weapons :=
  if(PLAYER.inventory.Weapon >= starting.level)
    weapons := Player.inventory.WeaponType.starting
  if(PLAYER.inventory.Weapon >= bad.level)
    weapons := weapons . ", " . Player.inventory.WeaponType.bad
  if(PLAYER.inventory.Weapon >= fine.level)
    weapons := weapons . ", " . Player.inventory.WeaponType.fine
  if(PLAYER.inventory.Weapon >= good.level)
    weapons := weapons . ", " . Player.inventory.WeaponType.good
  if(PLAYER.inventory.Weapon >= amazing.level)
    weapons := weapons . ", " . Player.inventory.WeaponType.amazing
  return weapons
}
