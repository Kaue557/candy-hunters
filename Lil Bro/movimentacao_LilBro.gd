extends CharacterBody2D

@export var move_speed : float = 130

# quando a tecla da direita é pressionada, o valor "right" se torna positivo e vamos pra direita
# se for pressionada "left" o valor é negativo, o que leva à esquerda. mesma coisa pra up e down
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	velocity = input_direction * move_speed
	
	move_and_slide()
