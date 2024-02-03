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
	"Hello, dear friend",
	"Welcome to HELL!"
	]

const lines_level_2: Array[String] = [
	"Hahahahahaha"
	]	
	
	
var levels: Dictionary = {"level0" : lines_level_0, "level1" : lines_level_1, "level2" : lines_level_2}
#const lines_level2: Array[String] = []
