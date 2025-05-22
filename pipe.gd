extends StaticBody2D

const PIPE_SPEED = -180

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y += 212
	position.x = 680

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_collide(Vector2(PIPE_SPEED,0) * delta)


func make_gap(gap_size):
	$Top.position.y -= gap_size / 2
	$Bottom.position.y += gap_size / 2
	$TopCollision.position.y -= gap_size / 2
	$BottomCollision.position.y += gap_size / 2


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
