extends Marker2D

@export var level : Node2D

@export var enemy_scene : PackedScene

@export_category("Enemies to spawn")
@export_range(1, 10, 1) var minimum_spawnees : float = 3
@export_range(10, 100, 1) var maximum_spawnees : float = 10

@export_category("Spawn time")
@export_range(0.1, 2.0, 0.1) var minimum_cooldown : float = 1.0
@export_range(2.0, 4.0, 0.1) var maximum_cooldown : float = 2.0

func _ready():
	set_timer_timeout()

func set_timer_timeout():
	$Cooldown.wait_time = randf_range(minimum_cooldown, maximum_cooldown)

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	var random_spread =  Vector2(randf_range(0.0, 50.0), randf_range(-25, 25))
	level.add_child(enemy_instance)
	enemy_instance.global_position = global_position + random_spread


func _on_cooldown_timeout():
	set_timer_timeout()
	for amount in randi_range(int(minimum_spawnees), int(maximum_spawnees)):
		spawn_enemy()
	$Cooldown.start()
