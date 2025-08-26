extends CharacterBody2D

@export var speed = 300.0
var direction = Vector2.ZERO

func _physics_process(_delta):
	direction.y = Input.get_axis("up", "down")
	velocity.y = speed * direction.y
	direction.x = Input.get_axis("left", "right")
	if direction.x:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if direction.y:
		velocity.y = speed * direction.y
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	velocity.normalized()
	move_and_slide()
