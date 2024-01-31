extends Node

var SPEED = 150
var JUMP_VELOCITY = -300
var level = 1

const lines_level_0: Array[String] = [
	"This is a creepy place.",
	"I should be careful around here.",
	"Whats that? A floating bench?"
	]

const lines_level_1: Array[String] = [
	"This is my home.",
	"I am at peace here.",
	"Wait, who is this guy?"
	]
var levels: Dictionary = {"level0" : lines_level_0, "level1" : lines_level_1}
#const lines_level2: Array[String] = []
