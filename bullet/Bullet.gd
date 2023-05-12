extends RigidBody2D

func _on_Bullet_body_entered(body):
	if body is TileMap:
		queue_free()
