
extends CharacterBody2D

@export var velocidade: float = 200.0
@onready var sprite: Sprite2D = $Sprite2D

# ESCOLHA DA FANTASIA ALEATORIAMENTE
var fantasias: Array[Texture2D] = [
	preload("res://NPC/esqueleto.png"),
	preload("res://NPC/lobisomen.png"),
	preload("res://NPC/vampiro.png"),
	preload("res://NPC/zumbi.png")	
]

var direcao: Vector2 = Vector2.ZERO
var tempo_restante: float = 0.0

func _ready() -> void:
	var indice = randi_range(0, fantasias.size() - 1)
	sprite.texture = fantasias[indice]
	
	escolher_comportamento()

# func seila(_nome) <- o underline significa "variável não usada"
func _physics_process(delta: float) -> void:
	tempo_restante -= delta

	if tempo_restante <= 0:
		escolher_comportamento()

	velocity = direcao * velocidade
	move_and_slide()


func escolher_comportamento() -> void:
	# 5% de chance de ficar parado
	if randf() < 0.05:
		direcao = Vector2.ZERO
		tempo_restante = randf_range(0.5, 1.5)

	else:
		# Escolhe uma direção aleatória
		direcao = Vector2(
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0)
		).normalized()

		# Anda por 1 a 4 segundos
		tempo_restante = randf_range(1.0, 4.0)

# DETECTA INPUT DO MOUSE
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("NPC selecionado!")
