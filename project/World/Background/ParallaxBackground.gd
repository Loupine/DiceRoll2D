extends ParallaxBackground


const _SCROLL_VELOCITY := Vector2(-.01, 0);
 
 
func _process(delta:float)-> void:
	var offset := get_scroll_offset() + _SCROLL_VELOCITY / delta
	set_scroll_offset(offset)
