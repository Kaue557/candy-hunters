extends Node2D

@export var skin : int = 0
@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = $Area2D
var doce_ativo = false

var skins_casas: Array[Texture2D] = [
	preload("res://Casa/abobra.png"),
	preload("res://Casa/cabana.png"),
	preload("res://Casa/casa_cemiterio.png"),
	preload("res://Casa/casa_aranha.png"),
	preload("res://Casa/circo.png"),
	preload("res://Casa/castelo.png")
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.body_entered.connect(_on_area_body_entered)

	sprite.texture = skins_casas[skin]
	
	#var indice = randi_range(0, skins_casas.size() - 1)
	#sprite.texture = skins_casas[indice]

	#print("Textura selecionada: ", sprite.texture)

func _on_area_body_entered(body):
	print("Detectado: ", body.name)
	print("Pertence ao grupo jogabilidade? ", body.is_in_group("jogabilidade"))
	
	if body.is_in_group("jogabilidade") and not doce_ativo:
		doce_ativo = true
