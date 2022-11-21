extends Control

var _player_died := false
var _score := 0
var _speed_modifier := 0.5

onready var _music_player : AudioStreamPlayer = get_node("/root/MusicPlayer")
onready var _ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var _scissors_obstacle_preload := preload("res://Obstacles/ScissorsObstacle.tscn")
onready var _mallet_obstacle_preload := preload("res://Obstacles/MalletObstacle.tscn")
onready var _box_obstacle_preload := preload("res://Obstacles/BoxObstacle.tscn")
onready var _axe_obstacle_preload := preload("res://Obstacles/AxeObstacle.tscn")
onready var _obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var _speed_modifier_increase_timer := get_node("SpeedModifierIncreaseTimer")
onready var _restart_button := get_node("RestartButton")
onready var _menu_button := get_node("MenuButton")
onready var _score_label := get_node("ScoreLabel")
onready var _background := get_node("ParallaxBackground")
onready var _player : KinematicBody2D = get_node("Player")


func _ready()-> void:
	randomize()
	_music_player.play(0)


func _process(_delta)-> void:
	if _player_died == false:
		_score += 1
		_score_label.text = String(_score)


func _create_new_obstacle()-> void:
	var obstacle_number := randi() % 5 + 1
	if obstacle_number == 1:
		var new_ball_obstacle : PhysicsBody2D = _ball_obstacle_preload.instance()
		new_ball_obstacle.call("set_speed", _speed_modifier)
		add_child(new_ball_obstacle)
	elif obstacle_number == 2:
		var new_scissors_obstacle : PhysicsBody2D = _scissors_obstacle_preload.instance()
		add_child(new_scissors_obstacle)
		new_scissors_obstacle.call("move_to_player", _speed_modifier)
	elif obstacle_number == 3:
		var new_mallet_obstacle : PhysicsBody2D = _mallet_obstacle_preload.instance()
		add_child(new_mallet_obstacle)
		new_mallet_obstacle.call("move_to_player", _speed_modifier)
	elif obstacle_number == 4:
		var new_box_obstacle : PhysicsBody2D = _box_obstacle_preload.instance()
		add_child(new_box_obstacle)
		new_box_obstacle.call("move_to_player", _speed_modifier)
	elif obstacle_number == 5:
		var new_axe_obstacle : PhysicsBody2D = _axe_obstacle_preload.instance()
		add_child(new_axe_obstacle)
		new_axe_obstacle.call("move_to_player", _speed_modifier)


func _on_ObstacleSpawnTimer_timeout()-> void:
	if _player_died == false:
		_create_new_obstacle()
	_obstacle_spawn_timer.stop()


func _on_SpeedModifierIncreaseTimer_timeout()-> void:
	_speed_modifier += .005
	if _speed_modifier >= 2.5:
		_speed_modifier_increase_timer.stop()
	_background.call("increase_scroll_velocity")
	_player.call("increase_animation_speed")


func _on_RestartButton_pressed()-> void:
	var _ignored := get_tree().reload_current_scene()


func _on_MenuButton_pressed()-> void:
	var _ignored := get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_OutOfBoundsArea_body_entered(body : PhysicsBody2D)-> void:
	body.queue_free()
	_obstacle_spawn_timer.start(rand_range(1, 6 / _speed_modifier))


func _on_Player_player_died()-> void:
	_restart_button.rect_position.x = 400
	_menu_button.rect_position.x = 460
	_player_died = true
	_music_player.stop()
	_background.call("stop_parallax")
	_speed_modifier_increase_timer.stop()
