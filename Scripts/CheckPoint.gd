extends Area3D

@onready var check_point_visual = %CheckPointVisual


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.check_point = check_point_visual.global_position
