extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var muzzle = $Muzzle
@onready var animation_tree : AnimationTree = $AnimationTree

signal bullet_shot(bullet_scene, location)
signal facing_r()
signal facing_l()
var bullet_scene = preload("res://bullet.tscn")


#@export var JUMP_VELOCITY = -300.0
@export var DOUBLE_JUMP_VELOCITY = -200.0
@export var DASH_VELOCITY : float = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped = false
var dashing = false
var can_dash = true
var coyote_frames = 6
var coyote = false
var last_floor = false
var jumping = false
var direction2

func _ready():
	$coyote_timer.wait_time = coyote_frames / 60.0
	animation_tree.active = true

func _process(_delta):
	if Input.is_action_just_pressed("shoots"):
		shoot()

func shoot():
	bullet_shot.emit(bullet_scene, muzzle.global_position)
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		jumping = true
	else:
		jumping = false
		has_double_jumped = false
		
	if not is_on_floor() and last_floor and not jumping:
		coyote = true
		$coyote_timer.start()
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or coyote:
			velocity.y = GlobalScript.JUMP_VELOCITY
			jumping = true
		elif not has_double_jumped:
			velocity.y = DOUBLE_JUMP_VELOCITY
			has_double_jumped = true
			
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
	
	#if Input.is_action_just_pressed("interact"):
		#DialogueManager.start_dialogue(global_position, lines)

	var dash_direction
	if (sprite.is_flipped_h() == false):
		dash_direction = 1
		
	else:
		dash_direction = -1;
		
	
	if dashing:
		velocity.x = dash_direction * DASH_VELOCITY
	
	var direction = Input.get_axis("left", "right")
	direction2 = Input.get_vector("left", "right", "down", "up")
	if direction:
		if not dashing:
			#velocity.x = direction * DASH_VELOCITY
			velocity.x = direction * GlobalScript.SPEED
		if direction < -0.1:
			sprite.set_flip_h(true)
			facing_l.emit()
		if direction > 0.1:
			sprite.set_flip_h(false)
			facing_r.emit()
			


		
	else:
		velocity.x = move_toward(velocity.x, 0, GlobalScript.SPEED)
		animation.stop()
	
	update_animation()
	move_and_slide()
	last_floor = is_on_floor()

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction2.x)



func _unhandled_input(event):
	if event.is_action_pressed("interact"):
		GlobalScript.SPEED = 0
		GlobalScript.JUMP_VELOCITY = 0
		DialogueManager.start_dialogue(global_position, GlobalScript.levels["level" + str(GlobalScript.level)])


func _on_dash_timer_timeout():
	dashing = false # Replace with function body.


func _on_dash_again_timer_timeout():
	can_dash = true # Replace with function body.
