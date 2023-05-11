extends KinematicBody2D

export (int)var MOVEMENT_DISMINUTION = 50
var motion = Vector2()

func _physics_process(_delta):
	var player = get_parent().get_node("player")
	position += (player.position - position) / MOVEMENT_DISMINUTION
	look_at(player.position)
	move_and_collide(motion)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
