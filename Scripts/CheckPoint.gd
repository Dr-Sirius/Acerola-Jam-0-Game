extends Area3D

@onready var check_point_visual = %CheckPointVisual


func _on_body_entered(body):
	print(body.name)
	if "check_point" in body:
		
		body.check_point = check_point_visual.global_position
		print("Player_In")

func _on_area_entered(area):
	if "check_point" in area: 
		area.check_point = check_point_visual.global_position
	if "check_point" in area.get_parent():
		area.get_parent().check_point = check_point_visual.global_position
