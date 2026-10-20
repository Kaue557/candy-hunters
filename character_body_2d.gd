
extends CharacterBody2D

@export var velocidade: float = 320.0

# Também podemos mudar para reconhecer WASD em Projeto → Configurações do Projeto → Mapa de Entrada (Input Map)
func _physics_process(_delta: float) -> void:
	var direcao = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
        "ui_down"
	)

	velocity = direcao * velocidade

	move_and_slide()
	
# AINDA NÃO SEI COMO ISSO TUDO FUNCIONA, TAMO JUNTO!
