extends CharacterBody2D

@export var player1: Node2D
@export var player2: Node2D

const speed: float = 300.0

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _ready() -> void:
	initialize()

func initialize():
	var offset = 0.0 if randf() < 0.5 else PI
	var angle = offset + randf_range(-PI/3.0, PI/3.0)
	velocity = Vector2(cos(angle), sin(angle)).normalized() * speed
	position = get_viewport_rect().size / 2.0
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.x < 0.0:
		player2.increment_score()
	else:
		player1.increment_score()

	await get_tree().create_timer(1.0).timeout
	initialize()
