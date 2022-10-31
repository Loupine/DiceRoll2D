extends KinematicBody2D


var velocity := Vector2.ZERO


func _physics_process(_delta : float)-> void:
	velocity.y = 0
	velocity.x = -700
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_BallArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
