extends RigidBody2D

func _on_Bullet_body_entered(body):
	if "TileSet" in body.name:
		queue_free()
