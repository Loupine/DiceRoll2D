extends KinematicBody2D


signal player_died

var _gravity := 0.98
var _jump_force := 25.0
var _has_touched_floor := false
var _jumps_remaining := 0
var _is_alive := true
var _velocity := Vector2.ZERO

onready var _playerCollision : CollisionShape2D = get_node("CollisionShape2D")
onready var _animator : AnimationPlayer = get_node("AnimationPlayer")
onready var _player_audio : AudioStreamPlayer = get_node("/root/PlayerAudio")
onready var _invincibility_shield := get_node("InvincibilityShield")


func _ready()->void:
	var _power_up = PowerUpToggle.connect("invincibility_toggled", self, "enable_invincibility")
	_power_up = PowerUpToggle.connect("speed_boosted", self, "increase_speed")


func _physics_process(delta : float)-> void:
	if _is_alive:
		_velocity.y = 0.0 if is_on_floor() else _velocity.y + _gravity / delta
		if Input.is_action_just_pressed("jump") and _jumps_remaining > 0:
			_player_audio.call("set_audio_stream", "jump")
			if _jumps_remaining == 2:
				_velocity.y = -_jump_force / delta
			else:
				_velocity.y = -_jump_force * 0.8 / delta
			_jumps_remaining -= 1
		if is_on_floor():
			_player_audio.call("set_audio_stream", "land")
			_velocity.y = -_set_bounce_force() / delta
			_jumps_remaining = 2
	else:
		_velocity.y = 0.0 if position.y >= 591 else _velocity.y + _gravity / delta
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	position.x = clamp(position.x, 132.9, 133)
	position.y = clamp(position.y, 54, 800)


func _set_bounce_force()-> int:
	randomize()
	return randi() % 10


func increase_animation_speed()-> void:
	_animator.playback_speed += .0005


func enable_invincibility()->void:
	_invincibility_shield.set_visible(true)


func increase_speed()->void:
	_jump_force = 50
	_gravity = 1.8
	var speed_timer = Timer.new()
	add_child(speed_timer)
	speed_timer.connect("timeout", self, "_speed_timeout")
	speed_timer.set_one_shot(true)
	speed_timer.start(30.0)


func _speed_timeout()->void:
	_jump_force = 25
	_gravity = .98
	print("speed timeout")


func die()-> void:
	if _invincibility_shield.visible:
		_invincibility_shield.set_visible(false)
	else:
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		scale.y = .10
		_is_alive = false
		_animator.stop()
		emit_signal("player_died")
