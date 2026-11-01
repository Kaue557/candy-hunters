extends Control

@onready var menu_inicial = $MenuInicial
@onready var hud = $HUD
@onready var game_over = $GameOver
@onready var big_bro = get_tree().get_first_node_in_group("BigBro")


func _ready():
	add_to_group("interface")

	
	menu_inicial.show()
	hud.hide()
	game_over.hide()

	controlar_personagens(false)
	big_bro.parar_cursor()

func controlar_personagens(ativo):
	var personagens = get_tree().get_nodes_in_group("jogabilidade")

	for personagem in personagens:
		if ativo:
			personagem.process_mode = Node.PROCESS_MODE_INHERIT
		else:
			personagem.process_mode = Node.PROCESS_MODE_DISABLED


func _on_botao_iniciar_pressed():
	big_bro.iniciar_cursor()
	menu_inicial.hide()
	hud.show()

	controlar_personagens(true)


func encerrar_partida():
	controlar_personagens(false)

	big_bro.parar_cursor()
	hud.hide()
	game_over.show()


func _on_botao_reiniciar_pressed():
	get_tree().reload_current_scene()
