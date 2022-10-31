extends Node2D


onready var ball_obstacle_preload := preload("res://Obstacles/BallObstacle.tscn")
onready var obstacle_spawn_timer := get_node("ObstacleSpawnTimer")


func _on_ObstacleSpawnTimer_timeout():
	var newObstacle := ball_obstacle_preload.instance()
	add_child(newObstacle)
	obstacle_spawn_timer.start()
