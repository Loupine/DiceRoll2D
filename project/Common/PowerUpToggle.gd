extends Node

var _is_speed_boosted setget set_speed_boosted, get_speed_boosted
var _activated_powerups := []


func _ready()-> void:
	_is_speed_boosted = false


func set_speed_boosted(value:bool)-> void:
	_is_speed_boosted = value
	if value:
		var timer = Timer.new()
		add_child(timer)
		timer.set_one_shot(true)
		timer.start(30.0)
		timer.connect("timeout", self, "_powerup_timeout")
		_activated_powerups.append("speed_boost")


func get_speed_boosted()-> bool:
	return _is_speed_boosted


func _powerup_timeout()->void:
	if _activated_powerups.pop_front() == "speed_boost":
		_is_speed_boosted = false


func reset_powerups()->void:
	_is_speed_boosted = false
