extends CharacterBody2D

const RUN_SPEED := 200.0
const JUMP_VELOCITY := -300.0

var gravity := ProjectSettings.get("physics/2d/default_gravity") as float


func _physics_process(delta: float):
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * RUN_SPEED
	velocity.y += gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
