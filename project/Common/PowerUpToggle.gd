extends Node

signal slowed_down
signal invincibility_toggled
signal speed_boosted


func boost_speed()-> void:
	emit_signal("speed_boosted")


func slow_down()->void:
	emit_signal("slowed_down")


func toggle_invincibility()->void:
	emit_signal("invincibility_toggled")
