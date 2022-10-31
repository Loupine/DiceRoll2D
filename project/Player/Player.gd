extends KinematicBody2D


signal player_died

const GRAVITY := 0.98
const JUMP_FORCE := 25

var has_touched_floor := false
var is_alive := true
var velocity := Vector2.ZERO

onready var playerCollision : CollisionShape2D = get_node("CollisionShape2D")


func _physics_process(delta : float):
	if is_alive:
		velocity.y = GRAVITY / delta if is_on_floor() else velocity.y + GRAVITY / delta
		
		if Input.is_action_pressed("jump") and has_touched_floor:
			velocity.y = -JUMP_FORCE / delta
			has_touched_floor = false
		if is_on_floor():
			has_touched_floor = true
		
	velocity = move_and_slide(velocity, Vector2.UP)


func die()-> void:
	playerCollision.call_deferred("set_disabled", true)
	scale.y = .10
	position.y = 590
	is_alive = false
	emit_signal("player_died")
