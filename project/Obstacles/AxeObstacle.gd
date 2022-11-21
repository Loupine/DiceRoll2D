extends KinematicBody2D


func _ready()-> void:
	position.x = 1700
	position.y = rand_range(110, 480)


func move_to_player(speed_modifier : float)-> void:
	var target_position := Vector2(-400, position.y)
	var time_to_move := 5.0 / speed_modifier
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
	var _property_tweener := tween.tween_property(self, "position", target_position, time_to_move)
	var _interval_tweener := tween.tween_interval(1)


func _on_AxeArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
