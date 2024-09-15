class_name Goal extends Area2D

var fix: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	$Timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	fix = true

func _on_body_entered(body: Node2D) -> void:
	if not fix:
		return
	if body.can_move:
		Ref.level_manager.end_level.call_deferred()
