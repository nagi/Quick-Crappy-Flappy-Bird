extends Node

@export var pipe_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pipe_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.make_gap(120)
	add_child(pipe)
