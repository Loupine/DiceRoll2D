extends Control

var _player_died := false
var _score := 0
var _speed_modifier := 0.5

onready var _ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var _scissors_obstacle_preload := preload("res://Obstacles/ScissorsObstacle.tscn")
onready var _mallet_obstacle_preload := preload("res://Obstacles/MalletObstacle.tscn")
onready var _box_obstacle_preload := preload("res://Obstacles/BoxObstacle.tscn")
onready var _axe_obstacle_preload := preload("res://Obstacles/AxeObstacle.tscn")
onready var _speed_boost_powerup_preload := preload("res://PowerUps/SpeedBoostPowerUp.tscn")
onready var _slow_down_powerup_preload := preload("res://PowerUps/SlowDownPowerUp.tscn")
onready var _invincibility_powerup_preload := preload("res://PowerUps/InvincibilityPowerUp.tscn")
onready var _music_player : AudioStreamPlayer = get_node("/root/MusicPlayer")
onready var _obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var _speed_modifier_increase_timer := get_node("SpeedModifierIncreaseTimer")
onready var _powerup_spawn_timer := get_node("PowerUpSpawnTimer")
onready var _restart_button := get_node("RestartButton")
onready var _menu_button := get_node("MenuButton")
onready var _score_label := get_node("ScoreLabel")
onready var _background := get_node("ParallaxBackground")
onready var _player : KinematicBody2D = get_node("Player")


func _ready()-> void:
	randomize()
	_music_player.play(0)
	var _ignored = PowerUpToggle.connect("slowed_down", self, "_slow_down")


func _process(_delta)-> void:
	if _player_died == false:
		_score += 1
		_score_label.text = String(_score)


func _create_new_obstacle()-> void:
	var _obstacle_number := randi() % 5 + 1
	var _new_obstacle : PhysicsBody2D
	if _obstacle_number == 1:
		_new_obstacle = _ball_obstacle_preload.instance()
		_new_obstacle.call("set_speed", _speed_modifier)
		add_child(_new_obstacle)
	else:
		if _obstacle_number == 2:
			_new_obstacle = _scissors_obstacle_preload.instance()
		if _obstacle_number == 3:
			_new_obstacle = _mallet_obstacle_preload.instance()
		if _obstacle_number == 4:
			 _new_obstacle = _box_obstacle_preload.instance()
		if _obstacle_number == 5:
			_new_obstacle = _axe_obstacle_preload.instance()
		
		add_child(_new_obstacle)
		_new_obstacle.call("move_to_player", _speed_modifier)


func _slow_down()->void:
	_speed_modifier /= 1.5


func _create_new_powerup()-> void:
	var _powerup_number := randi() % 3 + 1
	var _new_powerup : PhysicsBody2D
	if _powerup_number == 1:
		_new_powerup = _speed_boost_powerup_preload.instance()
	if _powerup_number == 2:
		_new_powerup = _slow_down_powerup_preload.instance()
	if _powerup_number == 3:
		_new_powerup = _invincibility_powerup_preload.instance()
	add_child(_new_powerup)


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
	_restart_button.rect_position.x = 394
	_menu_button.rect_position.x = 482
	_player_died = true
	_music_player.stop()
	_background.call("stop_parallax")
	_speed_modifier_increase_timer.stop()
	_powerup_spawn_timer.stop()
	PowerUpToggle.reset_powerups()


func _on_PowerUpSpawnTimer_timeout():
	_powerup_spawn_timer.start(rand_range(30.0, 50.0))
	_create_new_powerup()
