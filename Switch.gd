extends Node3D

@export var swap_obj: Node3D

var last_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	last_pos = swap_obj.global_position

func _physics_process(delta):
	last_pos = swap_obj.global_position
	if Input.is_action_just_pressed("Switch Position"):
		swap_obj.global_position = global_position
		global_position = last_pos
		
		
