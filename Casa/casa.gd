extends Area2D

@export var skin : int = 0
@onready var sprite: Sprite2D = $Sprite2D

var skins_casas: Array[Texture2D] = [
	preload("res://Casa/abobra.png"),
	preload("res://Casa/cabana.png"),
	preload("res://Casa/casa_cemiterio.png")
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Casa iniciada")
	
	var indice = randi_range(0, skins_casas.size() - 1)
	sprite.texture = skins_casas[indice]

	print("Textura selecionada: ", sprite.texture)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
