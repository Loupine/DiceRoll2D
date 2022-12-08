extends ParallaxBackground


var _scroll_velocity := Vector2(-.01, 0);
var _current_background_number := 1

onready var _main_background := get_node("MainLayer/MainBackground")
onready var _main_background2 := get_node("MainLayer/MainBackground2")
onready var _main_background3 := get_node("MainLayer/MainBackground3")
onready var _background_switch_timer := get_node("BackgroundSwitchTimer")

 
func _process(delta:float)-> void:
	var offset := get_scroll_offset() + _scroll_velocity / delta
	set_scroll_offset(offset)


func stop_parallax()-> void:
	_scroll_velocity = Vector2.ZERO
	_background_switch_timer.stop()


func increase_scroll_velocity()-> void:
	_scroll_velocity.x -= .0001


func _on_BackgroundSwitchTimer_timeout()-> void:
	var _tween := create_tween()
	if _current_background_number == 1:
		_main_background2.set_visible(true)
		var _property_tweener := _tween.tween_property(_main_background2, "position", Vector2(0.0,0.0), 1.0)
	if _current_background_number == 2:
		_main_background3.set_visible(true)
		var _property_tweener := _tween.tween_property(_main_background3, "position", Vector2(0.0,0.0), 1.0)
		_background_switch_timer.stop()
	_current_background_number += 1
