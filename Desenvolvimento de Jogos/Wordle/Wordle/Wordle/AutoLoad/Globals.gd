extends Node

var score = 0
var language = 0
var Difficulty = 1


func get_Difficulty():
	return Difficulty

func set_Difficulty(c):
	Difficulty = c


func get_score():
	return score
	
func set_score(c):
	score = score + c

func get_language():
	return language

func set_language(c):
	language = c


enum CheckLetter {
	NOT_CHECKED,
	NOT_IN_WORD,
	WRONG_PLACE,
	CORRECT,
}
