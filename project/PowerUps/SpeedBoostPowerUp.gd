extends KinematicBody2D

var _velocity := Vector2(-250, 0)


func _ready()->void:
	position.y = rand_range(75, 450)
	position.x = 1800


func _physics_process(_delta)-> void:
	_velocity = move_and_slide(_velocity, Vector2.UP)


func _on_PowerUpArea_body_entered(body:PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		PowerUpToggle.set_speed_boosted(true)
		queue_free()
