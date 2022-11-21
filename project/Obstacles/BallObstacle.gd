extends KinematicBody2D


var _velocity := Vector2.ZERO
var _speed := -1000.0


func _ready()-> void:
	position.y = 490
	position.x = 1700


func _physics_process(_delta : float)-> void:
	_velocity.y = 0
	_velocity.x = _speed
	_velocity = move_and_slide(_velocity, Vector2.UP)


func set_speed(_speed_modifier : float)-> void:
	_speed *= _speed_modifier


func _on_BallArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
