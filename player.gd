extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D


@export var SPEED = 150.0
@export var JUMP_VELOCITY = -300.0
@export var DOUBLE_JUMP_VELOCITY = -200.0
@export var DASH_VELOCITY : float = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped = false
var dashing = false
var can_dash = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		has_double_jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif not has_double_jumped:
			velocity.y = DOUBLE_JUMP_VELOCITY
			has_double_jumped = true
			
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
		#await(get_tree().create_timer(0.2).timeout)
		#dashing = false
		#can_dash = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if dashing:
			velocity.x = direction * DASH_VELOCITY
		else:
			velocity.x = direction * SPEED
		if direction < -0.1:
			sprite.set_flip_h(true)
		if direction > 0.1:
			sprite.set_flip_h(false)
			

		animation.play("walk")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.stop()

	move_and_slide()


func _on_dash_timer_timeout():
	dashing = false # Replace with function body.


func _on_dash_again_timer_timeout():
	can_dash = true # Replace with function body.
