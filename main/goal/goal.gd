class_name Goal extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.can_move:
		Ref.level_manager.end_level.call_deferred()
