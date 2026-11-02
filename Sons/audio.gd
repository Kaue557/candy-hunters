extends Node2D

@export var mute: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not mute:
		play_music()
		
func play_music():
	if not mute:
		$background_music.play()
