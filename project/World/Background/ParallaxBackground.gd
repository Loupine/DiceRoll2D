extends ParallaxBackground


var _scroll_velocity := Vector2(-.01, 0);
 
 
func _process(delta:float)-> void:
	var offset := get_scroll_offset() + _scroll_velocity / delta
	set_scroll_offset(offset)


func stop_parallax()-> void:
	_scroll_velocity = Vector2.ZERO
