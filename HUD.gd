extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var i=0
var score=0
# Called when the node enters the scene tree for the first time.
func _ready():
	$score.text=str(i) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i+=delta
	
	if (int(i)==3) :
		score+=1
		$score.text=str(score)
		i=0
		
