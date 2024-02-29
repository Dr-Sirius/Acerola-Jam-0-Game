extends Node3D

@export var swap_obj: Node3D
@export var move_with_obj: bool
@export var offset: Vector3
@onready var switch_timer = %SwitchTimer

var last_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	last_pos = swap_obj.global_position

func _physics_process(delta):
	
	last_pos = swap_obj.global_position
	
	if Input.is_action_just_pressed("Switch Position") and switch_timer.is_stopped():
		swap_obj.global_position = global_position
		global_position = last_pos
		offset *= -1
		switch_timer.start()
	
	if move_with_obj:
		global_position = swap_obj.global_position + offset
		
