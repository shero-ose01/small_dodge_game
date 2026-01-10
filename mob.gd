extends RigidBody2D

var weirdo = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	$ChangeDirectionTimer.wait_time = randf_range(0.5,2.0)
	$ChangeDirectionTimer.start()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func change_direction() -> void:
	if not weirdo:
		return
	var angle = randf_range(0.0,PI/2.0)
	$AnimatedSprite2D.rotation += angle
	linear_velocity = linear_velocity.rotated(angle)
