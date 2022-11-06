extends AudioStreamPlayer

var has_landed := false


func set_audio_stream(action : String)-> void:
	if action == "jump":
		has_landed = false
		stream = load("res://PlayerAudio/jump_sound.wav")
		play(0)
	else:
		if has_landed == false:
			has_landed = true
			stream = load("res://PlayerAudio/landing_sound.wav")
			play(0)
