extends TextureRect
class_name Stomach

var reward_nutrients = 1
var ingest_time = 1

func ingest_enemy(enemy):
	var timer = Timer.new()

	enemy.add_child(timer)
	timer.start(ingest_time)
	timer.timeout.connect(func():
		enemy.queue_free()
		Griller.nutrients = Griller.nutrients + reward_nutrients
	)
