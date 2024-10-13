extends CharacterBody2D

var life_time = 2.0
var life_spawn = 0.0
var speed = 400 

func _ready():
	add_to_group("bullets")  

func _physics_process(delta):
	position.y -= speed * delta
	
	life_spawn += delta
	if life_spawn > life_time:
		queue_free()  
