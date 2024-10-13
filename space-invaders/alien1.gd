extends CharacterBody2D

var speed = 100  
var direction = 1 

@onready var area : Area2D = get_node("../Area2D") 

func _ready():
	print(get_children()) 
	if area:
		area.body_entered.connect(_on_body_entered) 
	else:
		print("Nenašel jsem Area2D uzel!")

func _physics_process(_delta):
	velocity.x = speed * direction
	move_and_slide()

func _on_body_entered(body):
	if body.is_in_group("walls"): 
		direction *= -1  
	elif body.is_in_group("bullets"):
		queue_free() 
