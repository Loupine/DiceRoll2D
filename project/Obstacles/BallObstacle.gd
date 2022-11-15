extends KinematicBody2D


var _velocity := Vector2.ZERO
var _speed_modifier : float
var _speed : float


func _ready()-> void:
	position.y = 490
	position.x = 1700
	_speed = -1000


func _physics_process(_delta : float)-> void:
	_velocity.y = 0
	_velocity.x = _speed * _speed_modifier
	_velocity = move_and_slide(_velocity, Vector2.UP)


func modify_speed(_current_speed_modifier : float)-> void:
	_speed_modifier = _current_speed_modifier


func _on_BallArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
