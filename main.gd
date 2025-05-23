extends Node

@export var pipe_scene: PackedScene
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seed("Flappy Bird".hash())
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pipe_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.make_gap(150)
	pipe.connect("pipe_clear", _on_pipe_clear)
	add_child(pipe)

func _on_pipe_clear():
	score += 1
	$ScorePoint.play()

func _on_bird_game_over() -> void:
	$GameOver.play()
	get_tree().paused = true
	await get_tree().create_timer(0.5).timeout
	$CanvasLayer/Restart.show()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
