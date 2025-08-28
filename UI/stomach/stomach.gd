extends Node2D
class_name Stomach

@export var chewed_food_scene : PackedScene

func ingest_enemy(enemy):
	var chewed_food = chewed_food_scene.instantiate()
	enemy.queue_free()
	$ChewedFoodSpawn.add_child(chewed_food)


func _on_acid_body_entered(chewed_food : ChewedFood):
	chewed_food.degrade()
