
extends CharacterBody2D

@export var velocidade: float = 200.0

var direcao: Vector2 = Vector2.ZERO
var tempo_restante: float = 0.0


func _ready() -> void:
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
