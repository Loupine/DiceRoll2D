extends Control


onready var ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var obstacle_spawn_timer := get_node("ObstacleSpawnTimer")
onready var restart_button := get_node("RestartButton")


func _on_ObstacleSpawnTimer_timeout()-> void:
	var newObstacle := ball_obstacle_preload.instance()
	add_child(newObstacle)
	obstacle_spawn_timer.start()


func _on_Player_player_died()-> void:
	restart_button.rect_position.x = 400


func _on_RestartButton_pressed():
	var _ignored := get_tree().reload_current_scene()
