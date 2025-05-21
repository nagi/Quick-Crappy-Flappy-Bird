extends CharacterBody2D


const SPEED = 300.0
const BOOST_VELOCITY = -400.0
const TERMINAL_VELOCITY = 640
const ROTATION_ADJUSTMENT_CONSTANT = 0.66 
 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > TERMINAL_VELOCITY:
			velocity.y = TERMINAL_VELOCITY

	# Handle boost.
	if Input.is_action_pressed("boost"):
		velocity.y = BOOST_VELOCITY

	point_beak()
	move_and_slide()


func point_beak():
	if velocity.y < 160:
		rotation_degrees = velocity.y / 10
	elif velocity.y > 400:
		rotation_degrees = (velocity.y / 10) * ROTATION_ADJUSTMENT_CONSTANT
	else: 
		rotation_degrees = 0
