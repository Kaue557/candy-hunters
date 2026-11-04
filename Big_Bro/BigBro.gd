extends Node2D

@onready var sprite = $Sprite2D

var tentativas = 3
func verificar_personagem(personagem):
	if personagem == "LilBro":
		print("Big Bro venceu!")

	else:
		var interface = get_tree().get_first_node_in_group("interface")
		interface.registrar_erro()
#func verificar_personagem(personagem):
	#if personagem == "LilBro":
		#print("Big Bro venceu!")
#
	#else:
		#tentativas -= 1
		#var interface = get_tree().get_first_node_in_group("interface")
		#interface.registrar_erro()
		#print("Tentativas restantes: ", tentativas)
#
		#if tentativas <= 0:
			#print("Big Bro perdeu!")
#
			#get_tree().get_first_node_in_group("interface").encerrar_partida()

func iniciar_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Sprite2D.show()
	
func parar_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Sprite2D.hide()

func _ready():
	pass

func _process(_delta):
	global_position = get_global_mouse_position()
