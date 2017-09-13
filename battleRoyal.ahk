; The player creates a charcter and battles npc opponets in D&D style combat
; To create a new game hit the n key
; To change the players race hit the [e]lf [d]warf or [h]uman keys
; To change the players class hit the [f]ighter, [r]anger, or [m]age keys
; To generate a new combat encounter hit the g key
; To accept a new combat encounter hit the a key
; To attack with the players first weapon hit the 1 key, for the second weapon hit the 2 key, and so on
; to select other games, hit the 0 key


;Weapon Types
starting  := {chance: 5, damage: 4, level: 0}
bad       := {chance: 4, damage: 6, level: 1}
fine      := {chance: 3, damage: 8, level: 2}
good      := {chance: 2, damage: 10, level: 3}
amazing   := {chance: 1, damage: 12, level: 4}

;Weapons
MeleeWeapons    := {type: "weapon", actionPlayer: "attack with a", actionNPC: "attacks with a", starting: "dagger", bad: "shortsword", fine: "spear", good: "longsword", amazing: "Dragon Sword"}
RangeWeapons    := {type: "weapon", actionPlayer: "shoot with a", actionNPC: "shoots with a", starting: "blowgun", bad: "shortbow", fine: "crossbow", good: "longbow", amazing: "Magic bow"}
Spells          := {type: "spell", actionPlayer: "cast", actionNPC: "casts", starting: "frost", bad: "firebolt", fine: "earth shake", good: "magic missile", amazing: "Fireball"}
MonsterWeapons  := {type: "attack", actionPlayer: "attack with your", actionNPC:"attacks with its", starting: "claw", bad: "pounce", fine: "charge", good: "bite", amazing: "savage strike"}
ThrownWeapons   := {type: "weapon", actionPlayer: "throw a", actionNPC:"throws a", starting: "rock", bad: "throwing dagger", fine: "javlin", good: "throwing axe", amazing: "magic spear"}

;Armor
armors := Object()
armors[0]  := {armor: 8, NAME: "no", type: 0, level: 0}
armors[1]  := {armor: 9, NAME: "leather", type: 1, level: 1}
armors[2]  := {armor: 10, NAME: "boiled leather", type: 1, level: 2}
armors[3]  := {armor: 11, NAME: "chain shirt", type: 2, level: 3}
armors[4]  := {armor: 12, NAME: "breast plate", type: 2, level: 4}
armors[5]  := {armor: 13, NAME: "full suit", type: 3, level: 5}
armors[6]  := {armor: 14, NAME: "dragon bone", type: 3, level: 6}

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
PLAYER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, weapon: 0, armor:0, ref: "You", ext: "are"}
CHALLENGER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, weapon: 0, armor:0, ref: "Your foe", ext: "is"}

^!n::
  PLAYER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, weapon: 0, armor:0, ref: "You", ext: "are"}
  CHALLENGER := {race: HUMAN, class: FIGHTER, level: 1, health: 12, weapon: 0, armor:0, ref: "Your foe", ext: "is"}
  Clipboard = Champion, you have been selected to take part in an upcoming tournament! first pick your race: HUMAN, ELF, or DWARF. Then select a class FIGHTER, RANGER, or MAGE!
  Send ^v
Return

; Return to other games
^!0::
  Run games.ahk
  ExitApp

; Set the players race to human
!^h::
  PLAYER.race := HUMAN
  PLAYER.health := PLAYER.level * HUMAN.CON
Return

; Set the players race to elf
!^e::
  PLAYER.race := ELF
  PLAYER.health := PLAYER.level * ELF.CON
Return

; Set the players race to dwarf
!^d::
  PLAYER.race := DWARF
  PLAYER.health := PLAYER.level * DWARF.CON
Return

; Set the players class to fighter
!^f::
  PLAYER.class := FIGHTER
Return

; Set the players class to ranger
!^r::
  PLAYER.class := RANGER
Return

; Set the players class to mage
!^m::
  PLAYER.class := MAGE
Return

; Print the status of the player
!^c::
  class := PLAYER.class.NAME
  race := PLAYER.race.NAME
  level := PLAYER.level
  hp := PLAYER.health
  type := PLAYER.class.WeaponType.type
  weapons := weaponsOf(PLAYER)
  armor := armors[PLAYER.armor].NAME
  Clipboard = You are a level %level% %race% %class% with %hp% health. you have the following %type%s %weapons% and %armor% armor.
  Send ^v
Return

; Generate a new challenger
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
    if(type == 0 && CHALLENGER.armor < CHALLENGER.class.Armor)
      CHALLENGER.armor++
    else
      CHALLENGER.weapon++
    i++
  }
  wep := CHALLENGER.weapon
  arm := CHALLENGER.armor

  Clipboard = Your next challenger is %challengerRaceName%, %challengerClassName%, do you accept the challenger?
  Send ^v
Return

; Accept the challenge, or restate the current challenge
!^a::
  challengerClassName := CHALLENGER.class.NAME
  challengerRaceName := CHALLENGER.race.NAME
  hp := PLAYER.health
  wep := weaponsOf(PLAYER)
  Clipboard = You are battling a %challengerRaceName%, %challengerClassName%, you have %hp% health and can attack with %wep%
  Send ^v
Return

; Attack with the players first weapon
!^1::
  if(PLAYER.weapon >= 0 && CHALLENGER.health > 0){
    result := attack(PLAYER, CHALLENGER, starting, PLAYER.class.WeaponType.starting, PLAYER.class.WeaponType.actionPlayer, 0)
    result := result . counter()
    if (CHALLENGER.health <= 0)
      result := result . levelUp()
    Clipboard = %result%
    Send ^v
  }
Return

; Attack with the players second weapon
!^2::
  if(PLAYER.weapon >= 1 && CHALLENGER.health > 0){
    result := attack(PLAYER, CHALLENGER, bad, PLAYER.class.WeaponType.bad, PLAYER.class.WeaponType.actionPlayer, 0)
    result := result . counter()
    if (CHALLENGER.health <= 0)
      result := result . levelUp()
    Clipboard = %result%
    Send ^v
  }
Return

; Attack with the players first weapon
!^3::
  if(PLAYER.weapon >= 2 && CHALLENGER.health > 0){
    result := attack(PLAYER, CHALLENGER, fine, PLAYER.class.WeaponType.fine, PLAYER.class.WeaponType.actionPlayer, 0)
    result := result . counter()
    if (CHALLENGER.health <= 0)
      result := result . levelUp()
    Clipboard = %result%
    Send ^v
  }
Return

; Attack with the players first weapon
!^4::
  if(PLAYER.weapon >= 3 && CHALLENGER.health > 0){
    result := attack(PLAYER, CHALLENGER, good, PLAYER.class.WeaponType.good, PLAYER.class.WeaponType.actionPlayer, 0)
    result := result . counter()
    if (CHALLENGER.health <= 0)
      result := result . levelUp()
    if (Player.health <= 0)
      result := "GAME OVER"
    Clipboard = %result%
    Send ^v
  }
Return

; Attack with the players first weapon
!^5::
  if(PLAYER.weapon >= 4 && CHALLENGER.health > 0){
    result := attack(PLAYER, CHALLENGER, amazing, PLAYER.class.WeaponType.amazing, PLAYER.class.WeaponType.actionPlayer, 0)
    result := result . counter()
    if (CHALLENGER.health <= 0)
      result := result . levelUp()
    Clipboard = %result%
    Send ^v
  }
Return

counter(){
  global PLAYER, CHALLENGER, starting, bad, fine, good, amazing
  result :=
  if(CHALLENGER.health > 0){
    Random, attack, 0, CHALLENGER.weapon
    if(attack == 0){
      result := attack(CHALLENGER, PLAYER, starting, CHALLENGER.class.WeaponType.starting, CHALLENGER.class.WeaponType.actionNPC, 1)
    } else if(attack == 1){
      result := attack(CHALLENGER, PLAYER, bad, CHALLENGER.class.WeaponType.bad, CHALLENGER.class.WeaponType.actionNPC, 1)
    } else if(attack == 2){
      result := attack(CHALLENGER, PLAYER, fine, CHALLENGER.class.WeaponType.fine, CHALLENGER.class.WeaponType.actionNPC, 1)
    } else if(attack == 3){
      result := attack(CHALLENGER, PLAYER, good, CHALLENGER.class.WeaponType.good, CHALLENGER.class.WeaponType.actionNPC, 1)
    } else if(attack == 4){
      result := attack(CHALLENGER, PLAYER, amazing, CHALLENGER.class.WeaponType.amazing, CHALLENGER.class.WeaponType.actionNPC, 1)
    }
  }
  return result
}

; Has the Attacker attack the defender
attack(ATTACKER, DEFENDER, weapon, weaponType, actionType, handicap){
  output :=
  chanceToHit := weapon.chance - handicap
  mod := 0
  if(ATTACKER.class.AttackStat == "STR")
    mod := modifier(ATTACKER.race.STR)
  else if (ATTACKER.class.AttackStat == "INT")
    mod := modifier(ATTACKER.race.INT)
  damage := weapon.damage + mod
  Random, hit, 1, 20
  if (hit + chanceToHit >= armors[DEFENDER.armor].armor){
    Random, delt, 1, damage
    if(ATTACKER.weapon - 4 > 0)
      delt := delt + ATTACKER.weapon - 4

    if(hit + chanceToHit > 20){
      delt := delt * 2
      DEFENDER.health -= delt
      output := output . ATTACKER.ref . " " . actionType . " " . weaponType . " and its a critical hit! dealing " . delt . " damage! "
    } else {
      DEFENDER.health -= delt
      output := output . ATTACKER.ref . " " . actionType . " " . weaponType . " and its a hit! dealing " . delt . " damage! "
    }

    if(DEFENDER.health <= 0){
      output := output . DEFENDER.ref . " " . DEFENDER.ext . " slain! "
    } else if(DEFENDER.health < (DEFENDER.level * DEFENDER.race.CON) / 2){
      output := output . DEFENDER.ref . " " . DEFENDER.ext . " bloodied! "
    }
  } else {
    output := output . ATTACKER.ref . " " . actionType . " " . weaponType " and misses!"
  }
  return output
}

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
  return stat // 2 - 5
}

max(a,b){
  if (a > b)
    return a
  else
    return b
}

levelUp(){
  global PLAYER, armors
  PLAYER.level++
  PLAYER.health := PLAYER.level * PLAYER.race.CON
  result := "You have leveled up! You are now level " . PLAYER.level . " and have " . PLAYER.health " hitpoints! "
  Random, type, 0, 1
  if(type == 0 && PLAYER.armor < PLAYER.class.Armor){
    PLAYER.armor++
    result := result . "You also have acquired " . armors[PLAYER.armor].NAME . " armor."
  } else{
    PLAYER.weapon++
    if(PLAYER.weapon < 5){
      newWeapon :=
      if(PLAYER.weapon == 1)
        newWeapon := PLAYER.class.WeaponType.bad
      else if(PLAYER.weapon == 2)
        newWeapon := PLAYER.class.WeaponType.fine
      else if(PLAYER.weapon == 3)
        newWeapon := PLAYER.class.WeaponType.good
      else if(PLAYER.weapon == 4)
        newWeapon := PLAYER.class.WeaponType.amazing
      result := result . "You also have acquired " . newWeapon . "."
    } else {
      result := result . "You also attack harder and more accurately."
    }
  }
  return result
}
