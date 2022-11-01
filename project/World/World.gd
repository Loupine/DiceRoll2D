extends Control


var player_died := false
var score := 0

onready var ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var restart_button := get_node("RestartButton")
onready var menu_button := get_node("MenuButton")
onready var score_label := get_node("ScoreLabel")


func _process(_delta)-> void:
	if player_died == false:
		score += 1
		score_label.text = String(score)


func _on_ObstacleSpawnTimer_timeout()-> void:
	var newObstacle := ball_obstacle_preload.instance()
	add_child(newObstacle)
	if player_died == false:
		obstacle_spawn_timer.start()


func _on_Player_player_died()-> void:
	restart_button.rect_position.x = 400
	menu_button.rect_position.x = 460
	player_died = true


func _on_RestartButton_pressed()-> void:
	var _ignored := get_tree().reload_current_scene()


func _on_MenuButton_pressed()-> void:
	var _ignored := get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_OutOfBoundsArea_body_entered(body : PhysicsBody2D):
	body.queue_free()
