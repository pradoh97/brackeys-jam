extends RigidBody2D
class_name ChewedFood

@export var ingest_time = 1
@export var reward_nutrients = 1

func _ready():
	$Timer.wait_time = ingest_time

func _on_timer_timeout():
	Griller.nutrients = Griller.nutrients + reward_nutrients
	queue_free()

func degrade():
	gravity_scale = 0.1
	linear_velocity = linear_velocity*0.1
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(modulate, 0), ingest_time)
	$CPUParticles2D.emitting = true
	$Timer.start()
