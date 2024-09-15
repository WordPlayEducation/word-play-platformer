class_name StoryLabel extends Label

@export var sentences: Array[String]

var idx: int = -1
var sentence: String = ""

func _ready() -> void:
	%Timer.timeout.connect(_on_timeout)
	_on_timeout()
	text = ""

func _on_timeout() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "visible_ratio", 0.0, 0.4)
	await tween.finished
	
	if idx + 1 >= len(sentences):
		return
	idx += 1
	sentence = sentences[idx]
	text = sentence
	start_timer()
	
	tween = get_tree().create_tween()
	tween.tween_property(self, "visible_ratio", 1.0, 0.4)

func start_timer() -> void:
	%Timer.start(len(sentence) * 0.2 + 2.0)
