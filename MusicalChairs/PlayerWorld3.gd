extends KinematicBody2D

var motion = Vector2()
export var speed = 200

signal timeout
const DOWN = Vector2(0,1)

const TIME_PERIOD = 5.0 # 500ms

var time = 0

onready var Repeat = get_tree().get_root().get_child(0).get_child(2).get_child(0)
onready var Stopper = get_tree().get_root().get_child(0).get_child(2).get_child(1)
onready var Stopper2 = get_tree().get_root().get_child(0).get_child(2).get_child(2)
onready var Stopper3 = get_tree().get_root().get_child(0).get_child(2).get_child(3)


func _ready():
	pass
	

func _physics_process(delta):
	motion.x = speed
	time += delta


	if (time < TIME_PERIOD):
		if (is_on_wall()):
			position = Vector2(450,200)
		if(Input.is_action_pressed("ui_right")):
			speed += 5
			if (speed >= 600):
				speed = 400
			
		if(Input.is_action_pressed("ui_left")):
			speed -= 5
			if (speed <= 50):
				speed = 70
			
		
	elif(time >= TIME_PERIOD):
		Stopper.position = Vector2(810,200)
		Stopper2.position = Vector2(690,200)
		Stopper3.position = Vector2(570,200)
		
		
		speed = 0
		
		if (time >= TIME_PERIOD + .2):
			Stopper.position = Vector2(810,100)
			Stopper2.position = Vector2(690,100)
			Stopper3.position = Vector2(570,100)
			motion.y += 100

		
	motion = move_and_slide(motion, DOWN)
