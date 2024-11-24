extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const idle=0
const jumping=1
const falling=-1

@export var speed = 3
@export var maxjump = 450
@export var base = 520
var action
var height
var change



# Called when the node enters the scene tree for the first time.
func _ready():
	action=idle # Replace with function body.
	$sprite.animation="fall"
	$sprite.play()
	height = base-maxjump
	change = int(height / 5)
	print(height,"", change)
	$sprite.animation="run"
	print($sprite.animation)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_pressed("jump"):
			if action==idle:
				action=jumping
		position.y=int(position.y)		
		match(action):
			#Go up till y reaches maxjump height then play fall anim
			jumping:
				$sprite.animation="jump"
				if $sprite.frame==5:
					$sprite.playing = false
				position.y-=speed
				if position.y<maxjump:
					action=falling
			#Go down till y reaches base height again, then play run anim
			falling:
				$sprite.animation="fall"
				position.y+=speed
				change = int(height / ($sprite.frames.get_frame_count("fall")-1))
				var c = int(position.y/change)
				$sprite.frame=c
#					print("height:",height)
#					print($sprite.frame)
				print(int((position.y)),"|", c)
					
				
				if position.y>base:
					$sprite.animation="run"
					$sprite.playing = true
					action=idle

				
