extends KinematicBody2D


signal player_died

const GRAVITY := 0.98
const JUMP_FORCE := 25.0

var has_touched_floor := false
var is_alive := true
var velocity := Vector2.ZERO

onready var playerCollision : CollisionShape2D = get_node("CollisionShape2D")
onready var animator : AnimationPlayer = get_node("AnimationPlayer")


func _physics_process(delta : float)-> void:
	if is_alive:
		velocity.y = 0.0 if is_on_floor() else velocity.y + GRAVITY / delta
		if Input.is_action_pressed("jump") and has_touched_floor:
			velocity.y = -JUMP_FORCE / delta
			has_touched_floor = false
		if is_on_floor():
			velocity.y = -set_bounce_force() / delta
			has_touched_floor = true
	else:
		velocity.y = 0.0 if position.y >= 591 else velocity.y + GRAVITY / delta
		position.x = 134
	
	velocity = move_and_slide(velocity, Vector2.UP)


func set_bounce_force()-> int:
	randomize()
	return randi() % 10


func die()-> void:
	playerCollision.call_deferred("set_disabled", true)
	scale.y = .10
	is_alive = false
	animator.stop()
	emit_signal("player_died")
