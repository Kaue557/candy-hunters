extends CharacterBody2D

@export var move_speed : float = 150
@onready var sprite: Sprite2D = $Sprite2D

# ESCOLHA DA FANTASIA ALEATORIAMENTE
var fantasias: Array[Texture2D] = [
	preload("res://Lil_Bro/esqueleto.png"),
	preload("res://Lil_Bro/lobisomen.png"),
	preload("res://Lil_Bro/vampiro.png"),
	preload("res://Lil_Bro/zumbi.png")	
]

func _ready() -> void:
	var indice = randi_range(0, fantasias.size() - 1)
	sprite.texture = fantasias[indice]

# quando a tecla da direita é pressionada, o valor "right" se torna positivo e vamos pra direita
# se for pressionada "left" o valor é negativo, o que leva à esquerda. mesma coisa pra up e down
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	velocity = input_direction * move_speed
	
	move_and_slide()


# DETECTA INPUT DO MOUSE
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("LilBro selecionado!")
