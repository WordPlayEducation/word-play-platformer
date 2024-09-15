class_name Trans extends ColorRect

func trans_in() -> void:
	$AnimationPlayer.play("out")
	await $AnimationPlayer.animation_finished

func trans_out() -> void:
	$AnimationPlayer.play("in")
	await $AnimationPlayer.animation_finished
