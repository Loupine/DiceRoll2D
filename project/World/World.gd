extends Control


var player_died := false
var score := 0

onready var ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var scissors_obstacle_preload := preload("res://Obstacles/ScissorsObstacle.tscn")
onready var obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var restart_button := get_node("RestartButton")
onready var menu_button := get_node("MenuButton")
onready var score_label := get_node("ScoreLabel")


func _ready()-> void:
	randomize()


func _process(_delta)-> void:
	if player_died == false:
		score += 1
		score_label.text = String(score)


func create_new_obstacle()-> void:
	var obstacle_number := randi() % 2 + 1
	var new_obstacle : PhysicsBody2D
	if obstacle_number == 1:
		new_obstacle = ball_obstacle_preload.instance()
	else:
		new_obstacle = scissors_obstacle_preload.instance()
	add_child(new_obstacle)


func _on_ObstacleSpawnTimer_timeout()-> void:
	create_new_obstacle()
	obstacle_spawn_timer.start(rand_range(1, 4))
	if player_died == true:
		obstacle_spawn_timer.stop()


func _on_RestartButton_pressed()-> void:
	var _ignored := get_tree().reload_current_scene()


func _on_MenuButton_pressed()-> void:
	var _ignored := get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_OutOfBoundsArea_body_entered(body : PhysicsBody2D):
	body.queue_free()


func _on_Player_player_died()-> void:
	restart_button.rect_position.x = 400
	menu_button.rect_position.x = 460
	player_died = true
