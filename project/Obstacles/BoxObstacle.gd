extends KinematicBody2D


func _ready()-> void:
	position.y = 537
	position.x = 1700


func move_to_player(speed_modifier : float)-> void:
	var target_position := Vector2(-400, position.y)
	var time_to_move := 6.5 / speed_modifier
	var tween := create_tween()
	var _property_tweener := tween.tween_property(self, "position", target_position, time_to_move)


func _on_BoxArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
