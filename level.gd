extends Node2D
class_name Level

func _ready():
	var ui : UI = %UI
	Griller.ui = ui
	Griller.stomach = ui.get_stomach()

func _input(event):
	if event.is_action_pressed("debug_kill_enemy"):
		var enemy = $Enemies.get_children().pick_random()
		if enemy:
			Griller.stomach.ingest_enemy(enemy)

func get_enemies_node():
	return $Enemies
