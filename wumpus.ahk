Size := 10
Board := Object()
Player := Object(0,0)
Current =
Debug = 0

;Board Entities
Empty = 0
Pit = 1
Wumpus = 2
Slime = 3
Blood = 4
SlimeAndBlood = 5


;Directions
North = 0
East = 1
South = 2
West = 3

NewBoard(Size){
	Board := Object()
	i := 0
	Loop {
		if (i == Size * Size)
			break
		Board[i] := 0
		i++
	}
	Board := AddWumpus(Board, Size)
	Board := AddPits(Board, Size)
	Return Board
}

AddWumpus(Board, Size){
	Random, x, 0, Size
	Random, y, 0, Size
	Board[y*Size+x] := 2
	i = x-1+Size
	j = y-1+Size

	;outer
	Board[Mod(y+Size,Size)*Size + Mod(x+2+Size,Size)] := 4
	Board[Mod(y+Size,Size)*Size + Mod(x-2+Size,Size)] := 4
	Board[Mod(y-2+Size,Size)*Size + Mod(x+Size,Size)] := 4
	Board[Mod(y+2+Size,Size)*Size + Mod(x+Size,Size)] := 4

	;top
	Board[Mod(y-1+Size,Size)*Size + Mod(x-1+Size,Size)] := 4
	Board[Mod(y-1+Size,Size)*Size + Mod(x+Size,Size)] := 4
	Board[Mod(y-1+Size,Size)*Size + Mod(x+1+Size,Size)] := 4

	;side
	Board[Mod(y+Size,Size)*Size + Mod(x-1+Size,Size)] := 4
	Board[Mod(y+Size,Size)*Size + Mod(x+1+Size,Size)] := 4

	;bottom
	Board[Mod(y+1+Size,Size)*Size + Mod(x-1+Size,Size)] := 4
	Board[Mod(y+1+Size,Size)*Size + Mod(x+Size,Size)] := 4
	Board[Mod(y+1+Size,Size)*Size + Mod(x+1+Size,Size)] := 4
	Return Board
}

AddPits(Board, Size){
	i = 0
	Loop {
		if (i == 3)
			break
		Random, x, 0, Size
		Random, y, 0, Size
		if (Board[y*Size+x] == 0) {
			Board[y*Size+x] := 1

			;top
			if(Board[Mod(y-1+Size,Size)*Size + Mod(x-1+Size,Size)] == 4)
				Board[Mod(y-1+Size,Size)*Size + Mod(x-1+Size,Size)] := 5
			else if (Board[Mod(y-1+Size,Size)*Size + Mod(x-1+Size,Size)] == 0)
				Board[Mod(y-1+Size,Size)*Size + Mod(x-1+Size,Size)] :=3
			if(Board[Mod(y-1+Size,Size)*Size + Mod(x+Size,Size)] == 4)
				Board[Mod(y-1+Size,Size)*Size + Mod(x+Size,Size)] := 5
			else if (Board[Mod(y-1+Size,Size)*Size + Mod(x+Size,Size)] == 0)
				Board[Mod(y-1+Size,Size)*Size + Mod(x+Size,Size)] :=3
			if(Board[Mod(y-1+Size,Size)*Size + Mod(x+1+Size,Size)] == 4)
				Board[Mod(y-1+Size,Size)*Size + Mod(x+1+Size,Size)] := 5
			else if (Board[Mod(y-1+Size,Size)*Size + Mod(x+1+Size,Size)] == 0)
				Board[Mod(y-1+Size,Size)*Size + Mod(x+1+Size,Size)] :=3

			;side
			if(Board[Mod(y+Size,Size)*Size + Mod(x-1+Size,Size)] == 4)
				Board[Mod(y+Size,Size)*Size + Mod(x-1+Size,Size)] := 5
			else if (Board[Mod(y+Size,Size)*Size + Mod(x-1+Size,Size)] == 0)
				Board[Mod(y+Size,Size)*Size + Mod(x-1+Size,Size)] :=3
			if(Board[Mod(y+Size,Size)*Size + Mod(x+1+Size,Size)] == 4)
				Board[Mod(y+Size,Size)*Size + Mod(x+1+Size,Size)] := 5
			else if (Board[Mod(y+Size,Size)*Size + Mod(x+1+Size,Size)] == 0)
				Board[Mod(y+Size,Size)*Size + Mod(x+1+Size,Size)] :=3

			;bottom
			if(Board[Mod(y+1+Size,Size)*Size + Mod(x-1+Size,Size)] == 4)
				Board[Mod(y+1+Size,Size)*Size + Mod(x-1+Size,Size)] := 5
			else if (Board[Mod(y+1+Size,Size)*Size + Mod(x-1+Size,Size)] == 0)
				Board[Mod(y+1+Size,Size)*Size + Mod(x-1+Size,Size)] :=3
			if(Board[Mod(y+1+Size,Size)*Size + Mod(x+Size,Size)] == 4)
				Board[Mod(y+1+Size,Size)*Size + Mod(x+Size,Size)] := 5
			else if (Board[Mod(y+1+Size,Size)*Size + Mod(x+Size,Size)] == 0)
				Board[Mod(y+1+Size,Size)*Size + Mod(x+Size,Size)] :=3
			if(Board[Mod(y+1+Size,Size)*Size + Mod(x+1+Size,Size)] == 4)
				Board[Mod(y+1+Size,Size)*Size + Mod(x+1+Size,Size)] := 5
			else if (Board[Mod(y+1+Size,Size)*Size + Mod(x+1+Size,Size)] == 0)
				Board[Mod(y+1+Size,Size)*Size + Mod(x+1+Size,Size)] :=3


			i++
		}
	}
	Return Board
}

AddHunter(Board, Size){
	Loop{
		Random, x, 0, Size
		Random, y, 0, Size
		if(Board[y*Size+x] == 0){
			Player := Object()
			Player[0] := x
			Player[1] := y
			return Player
		}
	}
}

Move(Player, Direction, Size){
	if(direction == 0)
		Player[1] := Mod(Player[1]-1+Size,Size)
	else if (direction == 1)
		Player[0] := Mod(Player[0]+1+Size,Size)
	else if(direction == 2)
		Player[1] := Mod(Player[1]+1+Size,Size)
	else if (direction == 3)
		Player[0] := Mod(Player[0]-1+Size,Size)
	Return Player
}

Shoot(Player, Direction, Size, Board){
	won = 0
	i = 0
	if(Direction == 0 || Direction == 2){
		Loop {
			if (i == Size)
				break
			if(Board[Mod((Player[1]+i),Size)*Size+Player[0]] == 2){
				won = 1
				break
			}
			i++
		}
	} else if (Direction == 1 || Direction == 3) {
		Loop {
			if (i == Size)
				break
			if(Board[Player[1]*Size+Mod(Player[0]+i,Size)] == 2){
				won = 1
				break
			}
			i++
		}
	}
	Return won
}

^!n::
	Board := NewBoard(Size)
	Player := AddHunter(Board, Size)
	if(Debug == 1){
		i = 0
		Loop {
			Current := Board[i]
			if(i == Player[1]*size+Player[0]){
				send, O
			} else {
				if(i == Size * Size)
					break
				if(Current == 0)
					send, E
				if(Current == 2)
					send, W
				if(Current == 4)
					send, B
				if(Current == 1)
					send, P
				if(Current == 3)
					send, S
				if(Current == 5)
					send, G
			}
			if(Mod(i+1,10) == 0)
				send, {Enter}
			i++
		}
	}
	Clipboard = You are on the hunt for the Wumpus! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	Send ^v
Return

^!w::
	Player := Move(Player,North,Size)
	i = 0
	if(Board[Player[1]*Size+Player[0]] == Empty)
		Clipboard = You move north! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Slime)
		Clipboard = You move north! You feel a breeze! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Pit)
		Clipboard = You move north! The hunter has fallen into a pit! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Blood)
		Clipboard = You move north! You smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Wumpus)
		Clipboard = You move north! The hunter has walked into the lair of the Wumpus, the Wumpus will eat well tonight! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Goo)
		Clipboard = You move north! You feel a breeze! and you smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	Send ^v
Return

^!s::
	Player := Move(Player,South,Size)
	i = 0
	if(Board[Player[1]*Size+Player[0]] == Empty)
		Clipboard = You move south! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Slime)
		Clipboard = You move south! You feel a breeze! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Pit)
		Clipboard = You move south! The hunter has fallen into a pit! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Blood)
		Clipboard = You move south! You smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Wumpus)
		Clipboard = You move south! The hunter has walked into the lair of the Wumpus, the Wumpus will eat well tonight! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Goo)
		Clipboard = You move south! You feel a breeze! and you smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
    	Send ^v
Return

^!d::
	Player := Move(Player,East,Size)
	i = 0
	if(Board[Player[1]*Size+Player[0]] == Empty)
		Clipboard = You move east! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Slime)
		Clipboard = You move east! You feel a breeze! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Pit)
		Clipboard = You move east! The hunter has fallen into a pit! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Blood)
		Clipboard = You move east! You smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Wumpus)
		Clipboard = You move east! The hunter has walked into the lair of the Wumpus, the Wumpus will eat well tonight! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Goo)
		Clipboard = You move east! You feel a breeze! and you smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	Send ^v
Return

^!a::
	Player := Move(Player,West,Size)
	i = 0
	if(Board[Player[1]*Size+Player[0]] == Empty)
		Clipboard = You move west! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Slime)
		Clipboard = You move west! You feel a breeze! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Pit)
		Clipboard = You move west! The hunter has fallen into a pit! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Blood)
		Clipboard = You smell something foul{!} You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	if(Board[Player[1]*Size+Player[0]] == Wumpus)
		Clipboard = You move west! The hunter has walked into the lair of the Wumpus, the Wumpus will eat well tonight! You Lose!
	if(Board[Player[1]*Size+Player[0]] == Goo)
		Clipboard = You move west! You feel a breeze! and you smell something foul! You have 1 arrow, you may move or shoot in the directions of north, south, east, or west!
	Send ^v
Return

^!Up::
	if(Shoot(Player,North,Size,Board) == 1)
		Clipboard = You fire an arrow north! The hunter has slain the Wumpus, You Win!
	else
		Clipboard = You fire an arrow north! The hunter has been slain by an arrow, You Lose!
	Send ^v
Return

^!Down::
	if(Shoot(Player,South,Size,Board) == 1)
		Clipboard = You fire an arrow south! The hunter has slain the Wumpus, You Win!
	else
		Clipboard = You fire an arrow south! The hunter has been slain by an arrow, You Lose!
	Send ^v
Return

^!Left::
	if(Shoot(Player,West,Size,Board) == 1)
		Clipboard = You fire an arrow east! The hunter has slain the Wumpus, You Win!
	else
		Clipboard = You fire an arrow east! The hunter has been slain by an arrow, You Lose!
	Send ^v
Return

^!Right::
	if(Shoot(Player,East,Size,Board) == 1)
		Clipboard = You fire an arrow west! The hunter has slain the Wumpus, You Win!
	else
		Clipboard = You fire an arrow west! The hunter has been slain by an arrow, You Lose!
	Send ^v
Return

^!0::
	Run games.ahk
	ExitApp
