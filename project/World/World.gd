extends Control


var _player_died := false
var _score := 0

onready var _music_player : AudioStreamPlayer = get_node("/root/MusicPlayer")
onready var _ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var _scissors_obstacle_preload := preload("res://Obstacles/ScissorsObstacle.tscn")
onready var _obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var _restart_button := get_node("RestartButton")
onready var _menu_button := get_node("MenuButton")
onready var _score_label := get_node("ScoreLabel")
onready var _background := get_node("ParallaxBackground")


func _ready()-> void:
	randomize()
	_music_player.play(0)


func _process(_delta)-> void:
	if _player_died == false:
		_score += 1
		_score_label.text = String(_score)


func _create_new_obstacle()-> void:
	var obstacle_number := randi() % 2 + 1
	var new_obstacle : PhysicsBody2D
	if obstacle_number == 1:
		new_obstacle = _ball_obstacle_preload.instance()
	else:
		new_obstacle = _scissors_obstacle_preload.instance()
	add_child(new_obstacle)


func _on_ObstacleSpawnTimer_timeout()-> void:
	if _player_died == true:
		_obstacle_spawn_timer.stop()
	else:
		_create_new_obstacle()
		_obstacle_spawn_timer.start(rand_range(1, 4))


func _on_RestartButton_pressed()-> void:
	var _ignored := get_tree().reload_current_scene()


func _on_MenuButton_pressed()-> void:
	var _ignored := get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_OutOfBoundsArea_body_entered(body : PhysicsBody2D)-> void:
	body.queue_free()


func _on_Player_player_died()-> void:
	_restart_button.rect_position.x = 400
	_menu_button.rect_position.x = 460
	_player_died = true
	_music_player.stop()
	_background.call("stop_parallax")
