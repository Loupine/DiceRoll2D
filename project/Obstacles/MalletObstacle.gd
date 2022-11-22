extends KinematicBody2D


onready var _animator : AnimationPlayer = get_node("AnimationPlayer")
onready var _audio_player : AudioStreamPlayer = get_node("MalletAudioPlayer")


func _ready()-> void:
	position.x = 1700
	position.y = 514


func move_to_player(speed_modifier : float)-> void:
	_animator.playback_speed = speed_modifier
	_animator.play("move_to_player")


func _on_AnimationPlayer_animation_finished(anim_name)-> void:
	if anim_name == "move_to_player":
		_animator.play("smash")
	if anim_name == "smash":
		_audio_player.play()
		_animator.play("move_offscreen")


func _on_SmashArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
