extends KinematicBody2D


func _ready()-> void:
	position.y = 537
	position.x = 1700


func move_to_player(speed_modifier : float)-> void:
	var _target_position := Vector2(-400, position.y)
	var _time_to_move := 6.5 / speed_modifier
	var _tween := create_tween()
	var _property_tweener := _tween.tween_property(self, "position", _target_position, _time_to_move)


func _on_BoxArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
