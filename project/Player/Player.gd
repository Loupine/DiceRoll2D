extends KinematicBody2D


const GRAVITY := 0.98
const JUMP_FORCE := 3

var has_touched_floor := true
var velocity := Vector2.ZERO


func _physics_process(_delta : float):
	if Input.is_action_pressed("jump") and has_touched_floor:
		velocity.y = JUMP_FORCE
		has_touched_floor = false
	if is_on_floor():
		has_touched_floor = true
	
	velocity = move_and_slide(velocity, Vector2.UP)
