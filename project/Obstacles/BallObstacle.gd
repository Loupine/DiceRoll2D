extends KinematicBody2D


var _velocity := Vector2.ZERO


func _ready()-> void:
	position.y = 490
	position.x = 1700


func _physics_process(_delta : float)-> void:
	_velocity.y = 0
	_velocity.x = rand_range(-2000, -700)
	_velocity = move_and_slide(_velocity, Vector2.UP)


func _on_BallArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
