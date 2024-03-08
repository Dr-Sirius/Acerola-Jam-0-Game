extends AnimationPlayer



enum {
	IDLE,
	SWITCH,
}

var state = IDLE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_E) and current_animation == "Idle":
		state = SWITCH
	
	if !is_playing() and current_animation == "TimeSwitch":
		print("Cheese")
		state = IDLE
	
	match (state):
		
		IDLE:
			play("Idle")
		
		SWITCH:
			play("TimeSwitch")
			
			#play("Torus_002Action")
