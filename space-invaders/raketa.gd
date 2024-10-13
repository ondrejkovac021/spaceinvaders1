extends CharacterBody2D

var speed = 250
var Velocity = Vector2.ZERO 
var bullet_scene = preload("res://bullet.tscn")  

func _process(_delta): 
	velocity = Vector2.ZERO 

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	velocity = velocity.normalized() * speed
	move_and_slide()  
	

	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()

func fire_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position = position + Vector2(0, -30)  
	get_parent().add_child(bullet)  
