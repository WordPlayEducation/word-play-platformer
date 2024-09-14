class_name Recognizer extends Area2D

@export var question: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body is WordObject:
		return
	if Ref.creator.ask(question, body.text):
		kill.call_deferred()

func kill() -> void:
	%AnimationPlayer.play("kill")
	%StaticBody2D.queue_free()
	await %AnimationPlayer.animation_finished
	queue_free()
