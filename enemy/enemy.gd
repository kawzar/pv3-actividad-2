extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	var player = get_parent().get_node("player")
	position += (player.position - position) / 50
	look_at(player.position)
	move_and_collide(motion)
