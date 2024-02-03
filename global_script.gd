extends Node

var SPEED = 150
var JUMP_VELOCITY = -300
var level = 1

const intro: Array[String] = [
	"You feel the wind rustling as you approach 
	the abandoned castle.",
	"Under the light of the statue of the mouse king, 
	you feel a sense that this is the calm before 
	the storm...",
	"CONTROLS WSAD to move
	E to dash
	Space to jump
	Double space to double jump
	X to interact when prompted"
	]
	
const enter: Array[String] = [
	"You approach the rusty metal gates,
	immediately cutting yourself as you
	reach out to touch them.",
	"Suitably chastised, you take care
	as you squeeze yourself past the
	least sharp ones."
	] 
	
##Send into castle after above text
	
const castle_one: Array[String] = [
	"As you enter, the gates collapse
	behind you",
	"You must find a way out"
	]
	
const tablesStart: Array[String] = [
	"These massive tables, full of rotting food",
	"What happened here?"
	]
	
const tablesEnd: Array[String] = [
	"You walk across, taking care not to
	step into the disgusting maggots on
	the plates",
	"There is blood coughed up amidst the
	abandoned meat"
	]	

const kitchenEnter: Array[String] = [
	"You step into the kitchen",
	"The red glow of distant embers
	still burning through some dark
	magic",
	"You can smell some strange meat"
	]	

const kitchenMain: Array[String] = [
	"The lack of vegetables surprises you",
	"In their end days, it seemed these
	people were feeding on nothing but 
	this strange meat from some large
	animal you cannot identify immediately"
	]	

const stablesOne: Array[String] = [
	"You recognise the smell, it is more
	pungent than it was before but it is
	familiar. The horse meat from the kitchen
	came from here.",
	"Locked inside their castle, they must
	have started starving before turning on
	their majestic beasts."
	]	
	
const stablesTwo: Array[String] = [
	"You gag as you spot the dead horse
	on the ground",
	"It has been brutally killed and eaten."
	]
	
const lastChandlier: Array[String] = [
	"You feel the warmth of a well lit
	room up ahead.",
	"You can see that it is a chapel of
	some sort."
	]
	
const chapelEnter: Array[String] = [
	"Something is fundamentally wrong
	with this chapel, there is a dissonance here.",
	"You can see the beautiful sacred windows, but up
	ahead a darkened statue awaits.",
	"Someone has desecrated this place."
	]

const chapelStatue: Array[String] = [
	"You shudder as you hear a distant voice
	in your head",
	"'You think this is a mere game, do you
	not? Perhaps that is wise'",
	"'There are more things in heaven and earth
	than are dreamt of in your philosophy'",
	"'And I am the worst of them'",
	"'Run, little mouse...'",
	"You need to leave. Now."
	]
	
const dungeonOne: Array[String] = [
	"The long fall hurt a little, but you'll
	survive.",
	"You find yourself in a dark tunnel under the castle"
	]

const dungeonTwo: Array[String] = [
	"You can see light up ahead, a lantern
	glowing to mark the entrance to a cell.",
	"This must be a dungeon."
	]

const cellOne: Array[String] = [
	"You peek inside to see a horrific sight.",
	"A dead body, covered in cysts, blood oozing
	from its various pores. The horror overwhelms
	you for a second before you regain composure."
	]
	
const cellTwo: Array[String] = [
	"You've started walking faster, paying less
	attention to the bodies in the cells.",
	"You are struck by the lack of dead bodies of
	guards, perhaps they had enough time to escape?",
	"To abandon the prisoners thus..."
	]
	
const cellThree: Array[String] = [
	"What is this...?",
	"An empty cell, a tunnel...a way out",
	"As you walk through, you realise the tunnel
	doesn't lead all the way out. A little way in,
	you find the dead prisoners, digging tools
	still in hand. You look back, at the damned
	castle you've left behind.",
	"You sigh, pick up the shovel, and start
	digging...",
	]
	
	##Send into Main Menu after above text
	
const kitchenStairs: Array[String] = [
	"You see stairs leading up to
	some unknown destination.",
	"Up ahead, you see the dim glow
	of embers preserved by some dark
	entity."
	]

const secondStairs: Array[String] = [
	"You walk into a long hallway.",
	"There are doors, but they are all locked.
	You can tell this is supposed to be some 
	sort of servants' quarters",
	"Onwards."
	]
	
const preStableCorridor: Array[String] = [
	"You spot an old sign on the wall",
	"'STABLES DOWN THE STAIRS AHEAD' 
	it reads."
	]
	
const paintings: Array[String] = [
	"Paintings of multiple generations of
	Mouse Kings line the walls.",
	"Their glory, clear in the marble statues
	is diminised in this portrayal on canvas
	where the paint has dulled with time.",
	"How the times have changed."
	]
	
const underMarbleStairs: Array[String] = [
	"This is a strange room,
	full of plants of various kinds"
	]

const topOfMarbleStairs: Array[String] = [
	"You are at the entrance to a royal room,
	made of marble and gold.",
	"You can see a set of beautiful chandaliers
	behind you, they look like they could hold
	your weight. Perhaps you might want to jump
	onto them at some point?",
	"Suddenly, you head a noise from within the
	room, a groaning sound."
	]
	
const kingsRoomOne: Array[String] = [
	"As you walk into the room, you smell
	the blood. The flesh. The gore.",
	"You keep walking, horrified."
	]

const kingsRoomTwo: Array[String] = [
	"Bodies of slaughtered maids lie
	before you, dead of some poison or
	disease that inflicts the blood.",
	"'It is the plague,' a voice calls out
	from up ahead."
	]
	
const kingsRoomThree: Array[String] = [
	"A regal woman, wearing clothes fit
	for a Queen, lies on the ground.",
	"Her face is still pure, uninflicted
	unlike the rest of her body. She has
	been stabbed, slain by a sharp weapon
	of some sort.",
	"'My dear Hypathia!' the voice inside
	the room cries out"
	]

const kingsBed: Array[String] = [
	"You walk up to the bed cautiously and
	find the Mouse King. He is alive, but
	unmoving, face twisted, arms unnaturally
	bent and broken.",
	"'I brought this curse upon my people,'
	he says, startling you. He speaks in a
	deep guttaral tone.",
	"'It was my greed. I killed Hypathia
	before the Blood Plague got her, but
	I could not save anyone else.'",
	"'Do not go into the chapel,' he warns
	with bloodshot eyes.",
	"He begins wailing."
	]

const kingsCupboard: Array[String] = [
	"You find royal gowns of every kind
	and a note flutters to the bottom
	as you pick up a jacket.",
	"'SOON I SHALL ASK THAT CREATURE IN THE
	DARK FOR LIFE ETERNAL. TO LIVE FOREVER
	WITH HYPATHIA. TO RULE MY PEOPLE WITH 
	A STEADY HAND. THAT IS WORTH WHATEVER
	COST HE MAY IMPOSE'"
	]
	
const kingsStudy: Array[String] = [
	"The study is a flurry of activity, with
	papers everywhere. One catches your eye
	for it is caked in dried red.",
	"'I HAVE SENT THE GUARDS AWAY, MY WIFE
	IS INFECTED, THE PRISONERS ARE INFECTED.
	I ONLY HOPE WE CAN CONTAIN THIS PLAGUE.
	THE COST WAS TOO HIGH.'"
	]

	
var levels: Dictionary = {"intro" : intro, "enter" : enter ,"l1" : chapelStatue, "l2": castle_one, "l3": tablesStart, "l4": tablesEnd, "l5": kitchenEnter, "l6": kitchenMain, "l7": stablesOne,"l8": stablesTwo,"l9": lastChandlier,"l10": chapelEnter,"11": chapelStatue,"l12": dungeonOne,"l13": dungeonTwo,"l14": cellOne,"l15": cellTwo,"l16": cellThree,"l17": kitchenStairs,"l18": secondStairs,"l19": preStableCorridor,"l20": paintings,"l21": underMarbleStairs,"l22": topOfMarbleStairs,"l23": kingsRoomOne,"l24": kingsRoomTwo,"l25": kingsRoomThree,"l26": kingsBed,"l27": kingsCupboard,"l28": kingsStudy,"l29": enter}
#const lines_level2: Array[String] = []

