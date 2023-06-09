tool
extends KinematicBody2D

export (int)var MOTION_SPEED = 160 # Pixels/second
export (int)var bullet_speed = 1000
export (bool)var god_mode = false

func _physics_process(_delta):
	var motion = Vector2()
	
	if (Input.is_action_pressed("move_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("move_bottom")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("move_left")):
		motion += Vector2(-1, 0)
	if (Input.is_action_pressed("move_right")):
		motion += Vector2(1, 0)
	if (Input.is_action_just_pressed("shoot")):
		fire()
	
	motion = motion.normalized()*MOTION_SPEED
	motion = move_and_slide(motion)
	look_at(get_global_mouse_position())

func fire():
	var bullet_instance = Global.Bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
	get_tree().root.call_deferred("add_child", bullet_instance)
	
func kill():
	if !Engine.is_editor_hint():
		if !god_mode:
			get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill() 
