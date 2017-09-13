; The player creates a charcter and battles npc opponets in D&D style combat
; To create a new game hit the n key
; To change the players race hit the [e]lf [d]warf or [h]uman keys
; To change the players class hit the [f]ighter, [r]anger, or [m]age keys
; To generate a new combat encounter hit the g key
; To attack with the players first weapon hit the 1 key, for the second weapon hit the 2 key, and so on
; to select other games, hit the 0 key


;Weapon Types
starting  := {chance: 5, damage: 4, level: 0}
bad       := {chance: 4, damage: 6, level: 1}
fine      := {chance: 3, damage: 8, level: 2}
good      := {chance: 2, damage: 10, level: 3}
amazing   := {chance: 1, damage: 12, level: 4}

;Weapons
MeleeWeapons    := {type: "weapon", starting: "dagger", bad: "shortsword", fine: "spear", good: "longsword", amazing: "Dragon Sword"}
RangeWeapons    := {type: "weapon", starting: "blowgun", bad: "shortbow", fine: "crossbow", good: "longbow", amazing: "Magic bow"}
Spells          := {type: "spell", starting: "frost", bad: "firebolt", fine: "earth shake", good: "magic missile", amazing: "Fireball"}
MonsterWeapons  := {type: "attack", starting: "claw", bad: "pounce", fine: "charge", good: "bite", amazing: "savage strike"}
ThrownWeapons   := {type: "weapon", starting: "rock", bad: "throwing dagger", fine: "javlin", good: "throwing axe", amazing: "magic spear"}

;Armor
armors := Object()
armors[0]  := {armor: 5, NAME: "no", type: 0, level: 0}
armors[1]  := {armor: 6, NAME: "leather", type: 1, level: 1}
armors[2]  := {armor: 7, NAME: "boiled leather", type: 1, level: 2}
armors[3]  := {armor: 8, NAME: "chain shirt", type: 2, level: 3}
armors[4]  := {armor: 9, NAME: "breast plate", type: 2, level: 4}
armors[5]  := {armor: 10, NAME: "full suit", type: 3, level: 5}
armors[6]  := {armor: 11, NAME: "dragon bone", type: 3, level: 6}

;Classes
FIGHTER   := {AttackStat: "STR", Armor: 6, NAME: "fighter", WeaponType: MeleeWeapons}
RANGER    := {AttackStat: "STR", Armor: 4, NAME: "ranger", WeaponType: RangeWeapons}
MAGE      := {AttackStat: "INT",  Armor: 2, NAME: "mage", WeaponType: Spells}
MONSTER   := {ATTACKStat: "STR", Armor: 0, NAME: "monster", WeaponType: MonsterWeapons}
LESSER    := {ATTACKStat: "STR", Armor: 4, NAME: "lesser", WeaponType: ThrownWeapons}
GREATER   := {ATTACKStat: "INT", Armor: 6, NAME: "greater", WeaponType: Spells}

;Valid Classes
HUMAN_CLASSES     := Object()
HUMAN_CLASSES[0]  := FIGHTER
HUMAN_CLASSES[1]  := RANGER
HUMAN_CLASSES[2]  := MAGE

ELF_CLASSES       := Object()
ELF_CLASSES[0]    := FIGHTER
ELF_CLASSES[1]    := RANGER
ELF_CLASSES[2]    := MAGE

DWARF_CLASSES     := Object()
DWARF_CLASSES[0]  := FIGHTER
DWARF_CLASSES[1]  := RANGER
DWARF_CLASSES[2]  := MAGE

GOBLIN_CLASSES    := Object()
GOBLIN_CLASSES[0] := LESSER
GOBLIN_CLASSES[1] := GREATER

WOLF_CLASSES      := Object()
WOLF_CLASSES[0]   := MONSTER

ORC_CLASSES       := Object()
ORC_CLASSES[0]    := FIGHTER
ORC_CLASSES[1]    := RANGER
ORC_CLASSES[2]    := LESSER

CAT_CLASSES       := Object()
CAT_CLASSES[0]    := MONSTER

HALF_CLASSES      := Object()
HALF_CLASSES[0]   := FIGHTER
HALF_CLASSES[1]   := RANGER
HALF_CLASSES[2]   := MAGE

DHAMP_CLASSES     := Object()
DHAMP_CLASSES[0]  := LESSER
DHAMP_CLASSES[1]  := GREATER

;Races
HUMAN   := {STR: 12, CON: 12, INT: 10, NAME: "human", CLASSES: HUMAN_CLASSES, numOfClasses: 3}
ELF     := {STR: 10, CON: 10, INT: 14, NAME: "elf", CLASSES: ELF_CLASSES, numOfClasses: 3}
DWARF   := {STR: 12, CON: 14, INT: 8, NAME: "dwarf", CLASSES: DWARF_CLASSES, numOfClasses: 3}
GOBLIN  := {STR: 10, CON: 10, INT: 8, NAME: "goblin", CLASSES: GOBLIN_CLASSES, numOfClasses: 2}
WOLF    := {STR: 12, CON: 16, INT: 5, Name: "dire wolf", CLASSES: WOLF_CLASSES, numOfClasses: 1}
ORC     := {STR: 14, CON: 14, INT: 6, NAME: "orc", CLASSES: ORC_CLASSES, numOfClasses: 3}
CAT     := {STR: 10, CON: 16, INT: 8, NAME: "shadow cat", CLASSES: CAT_CLASSES, numOfClasses: 1}
HALF    := {STR: 8, CON: 8, INT: 8, NAME: "halfling", CLASSES: HALF_CLASSES, numOfClasses: 3}
DHAMP   := {STR: 14, CON: 14, INT: 14, NAME: "dhampire", CLASSES: DHAMP_CLASSES, numOfClasses: 2}

;Race array
NUM_OF_RACES := 9

RACES     := Object()
RACES[0]  := HUMAN
RACES[1]  := ELF
RACES[2]  := DWARF
RACES[3]  := GOBLIN
RACES[4]  := WOLF
RACES[5]  := ORC
RACES[6]  := CAT
RACES[7]  := HALF
RACES[8]  := DHAMP

;Player
PLAYER := {race: HUMAN, class: FIGHTER, level: 5, health: 12, weapon: 0, armor:0}
CHALLENGER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, weapon: 0, armor:0}

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
Return

!^r::
  PLAYER.class := RANGER
Return

!^m::
  PLAYER.class := MAGE
Return

!^c::
  class := PLAYER.class.NAME
  race := PLAYER.race.NAME
  level := PLAYER.level
  health := PLAYER.health
  type := PLAYER.class.WeaponType.type
  weapons := weaponsOf(PLAYER)
  armor := armors[PLAYER.armor].NAME
  Clipboard = You are a level %level% %race% %class% with %health% health. you have the following %type%s %weapons% and %armor% armor.
  Send ^v
Return

!^g::
  global CHALLENGER, NUM_OF_RACES, RACES, PLAYER

  ;challenger race
  Random, race, 0, NUM_OF_RACES - 1
  CHALLENGER.race := RACES[race]
  challengerRaceName := CHALLENGER.race.NAME


  ;challenger class
  Random, class, 0, CHALLENGER.race.numOfClasses - 1
  CHALLENGER.class := CHALLENGER.race.CLASSES[class]
  challengerClassName := CHALLENGER.class.NAME

  ;level
  Random, difficulty, 0, 1
  CHALLENGER.level := max(PLAYER.level - difficulty,1)
  lvl := CHALLENGER.level

  ;health
  CHALLENGER.health := CHALLENGER.race.CON * CHALLENGER.level
  hp := CHALLENGER.health

  ;weapons and armor
  i = 0
  CHALLENGER.weapon := 0
  CHALLENGER.armor := 0
  Loop {
    if(i == lvl)
      break
    Random, type, 0, 1
    if(type == 0)
      CHALLENGER.weapon++
    else
      CHALLENGER.armor++
    i++
  }
  wep := CHALLENGER.weapon
  arm := CHALLENGER.armor

  Clipboard = Your next challenger is %challengerRaceName%, %challengerClassName% 
  Send ^v
Return

weaponsOf(PLAYER){
  global starting, bad, fine, good, amazing
  weapons :=
  if(PLAYER.Weapon >= starting.level)
    weapons := PLAYER.class.WeaponType.starting
  if(PLAYER.Weapon >= bad.level)
    weapons := weapons . ", " . Player.class.WeaponType.bad
  if(PLAYER.Weapon >= fine.level)
    weapons := weapons . ", " . Player.class.WeaponType.fine
  if(PLAYER.Weapon >= good.level)
    weapons := weapons . ", " . Player.class.WeaponType.good
  if(PLAYER.Weapon >= amazing.level)
    weapons := weapons . ", " . Player.class.WeaponType.amazing
  return weapons
}

modifier(stat){
  return 5 - stat / 2
}

max(a,b){
  if (a > b)
    return a
  else
    return b
}
