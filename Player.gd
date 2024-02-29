extends CharacterBody3D


const SPEED = 3.5
const JUMP_VELOCITY = 4

@onready var cam = %Cam

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_captured = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	is_captured = true
	
func _input(event):
	if event.is_action_pressed("ui_cancel") and !is_captured:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		is_captured = true
	
	elif event.is_action_pressed("ui_cancel") and is_captured:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		is_captured = false


func _unhandled_input(event):
	if event is InputEventMouseMotion and is_captured:
		rotate_y(deg_to_rad(-event.relative.x * 0.3))
		cam.rotate_x(deg_to_rad(-event.relative.y * 0.3))
		cam.rotation.x = clamp(cam.rotation.x,deg_to_rad(-65),deg_to_rad(60))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forwared", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
