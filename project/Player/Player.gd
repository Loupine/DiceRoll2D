extends KinematicBody2D


signal player_died

const _GRAVITY := 0.98
const _JUMP_FORCE := 25.0

var _has_touched_floor := false
var _jumps_remaining := 0
var _is_alive := true
var _velocity := Vector2.ZERO

onready var _playerCollision : CollisionShape2D = get_node("CollisionShape2D")
onready var _animator : AnimationPlayer = get_node("AnimationPlayer")
onready var _player_audio : AudioStreamPlayer = get_node("/root/PlayerAudio")


func _physics_process(delta : float)-> void:
	if _is_alive:
		_velocity.y = 0.0 if is_on_floor() else _velocity.y + _GRAVITY / delta
		if Input.is_action_just_pressed("jump") and _jumps_remaining > 0:
			_player_audio.call("set_audio_stream", "jump")
			if _jumps_remaining == 2:
				_velocity.y = -_JUMP_FORCE / delta
			else:
				_velocity.y = -_JUMP_FORCE * 0.8 / delta
			_jumps_remaining -= 1
		if is_on_floor():
			_player_audio.call("set_audio_stream", "land")
			_velocity.y = -_set_bounce_force() / delta
			_jumps_remaining = 2
	else:
		_velocity.y = 0.0 if position.y >= 591 else _velocity.y + _GRAVITY / delta
	
	_velocity = move_and_slide(_velocity, Vector2.UP)


func _set_bounce_force()-> int:
	randomize()
	return randi() % 10


func increase_animation_speed()-> void:
	_animator.playback_speed += .0005


func die()-> void:
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(0, false)
	scale.y = .10
	_is_alive = false
	_animator.stop()
	emit_signal("player_died")
