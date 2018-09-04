
extends StaticBody

export var locked = false
var closed = true
var animating = false


func interact(by):
	if !animating:

		if !locked:
			$AnimationPlayer.play("lock")
			locked = true
		else:
			$AnimationPlayer.play_backwards("lock")
			locked = false


func pick_up(by):
	if !animating:

		if !locked:
			if closed:
				$AnimationPlayer.play("open")
				closed = false
			else:
				$AnimationPlayer.play_backwards("open")
				closed = true


func _on_AnimationPlayer_animation_finished(anim_name):
	animating = false

func _on_AnimationPlayer_animation_started(anim_name):
	animating = true
