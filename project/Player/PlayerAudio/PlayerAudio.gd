extends AudioStreamPlayer


var _has_landed := false


func set_audio_stream(action : String)-> void:
	if action == "jump":
		_has_landed = false
		stream = load("res://Player/PlayerAudio/jump_sound.wav")
		play(0)
	else:
		if _has_landed == false:
			_has_landed = true
			stream = load("res://Player/PlayerAudio/landing_sound.wav")
			play(0)
