extends CharacterBody2D

@export var player_id: int
@export var score_label: Label

const speed: float = 350.0 
var score: int = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('up-%d' % player_id):
		velocity = Vector2(0, -speed)
	if event.is_action_pressed('down-%d' % player_id):
		velocity = Vector2(0, speed)
	if event.is_action_released('up-%d' % player_id) or event.is_action_released('down-%d' % player_id):
		velocity = Vector2.ZERO
		
func _physics_process(delta: float) -> void:
	move_and_slide()
	if player_id == 0:
		position.x = 71.0
	else:
		position.x = 1081.0

func increment_score() :
	score += 1
	score_label.text = '%02d' % score
