extends CharacterBody2D

@export var speed = 300.0
var direction = Vector2.ZERO

func _physics_process(_delta):
	direction.y = Input.get_axis("up", "down")
	velocity.y = speed * direction.y
	direction.x = Input.get_axis("left", "right")
	if direction.x:
		velocity.x = direction.x
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if direction.y:
		velocity.y = direction.y
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	velocity = velocity.normalized() * speed
	move_and_slide()

func _input(event):
	if event.is_action_pressed("attack"):
		var rotation_offset = 180
		$AttackArea/CollisionPolygon2D.look_at(get_global_mouse_position())
		$AttackArea/CollisionPolygon2D.rotation_degrees += rotation_offset
		$AttackAnimation.play("swing")
