extends Button

func _ready() -> void:
	# Pivot in die Mitte des Buttons setzen
	pivot_offset = size / 2.0

func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.50)


func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.15)
