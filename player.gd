extends CharacterBody2D

@onready var animation = $AnimatedSprite2D


@export var SPEED = 150.0
@export var JUMP_VELOCITY = -300.0
@export var DOUBLE_JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped = false

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

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction < -0.1:
			animation.set_flip_h(true)
		if direction > 0.1:
			animation.set_flip_h(false)
			

		animation.play("walk")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.stop()

	move_and_slide()
