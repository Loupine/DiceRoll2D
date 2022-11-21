extends KinematicBody2D


onready var animator : AnimationPlayer = get_node("AnimationPlayer")


func _ready()-> void:
	position.x = 1700
	position.y = 514


func move_to_player(speed_modifier : float)-> void:
	animator.playback_speed = speed_modifier
	animator.play("move_to_player")


func _on_AnimationPlayer_animation_finished(anim_name)-> void:
	if anim_name == "move_to_player":
		animator.play("smash")


func _on_SmashArea_body_entered(body : PhysicsBody2D)-> void:
	if body.is_in_group("Player"):
		body.call("die")
