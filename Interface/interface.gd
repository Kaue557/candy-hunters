extends Control

@onready var menu_inicial = $MenuInicial
@onready var hud = $HUD
@onready var game_over1 = $GameOver1
@onready var game_over2 = $GameOver2
@onready var big_bro = get_tree().get_first_node_in_group("BigBro")
@onready var background_music = $"../../Audio/background_music"
@onready var numero_tentativas: Label = $HUD/Tentativas/NumeroTentativas
@onready var tutorial: Label = $MenuInicial/tutorial


var tentativas = 3

func _ready():
	add_to_group("interface")

	#if not background_music.playing:
	Audio.play_music()
		#background_music.play()

	menu_inicial.show()
	tutorial.text = str("Big Bro (cursor): ache o seu irmão no meio de tantas fantasias\nLil Bro: não seja encontrado!")
	hud.hide()
	game_over1.hide()
	game_over2.hide()

	atualizar_tentativas()

	controlar_personagens(false)
	big_bro.parar_cursor()


func controlar_personagens(ativo):
	var personagens = get_tree().get_nodes_in_group("jogabilidade")

	for personagem in personagens:
		if ativo:
			personagem.process_mode = Node.PROCESS_MODE_INHERIT
		else:
			personagem.process_mode = Node.PROCESS_MODE_DISABLED


func atualizar_tentativas():
	numero_tentativas.text = str("Tentativas: ", tentativas)


func registrar_erro():
	tentativas -= 1
	atualizar_tentativas()

	if tentativas <= 0: # significa que o LilBro venceu
		encerrar_partida1()


func _on_botao_iniciar_pressed():
	big_bro.iniciar_cursor()
	menu_inicial.hide()
	hud.show()

	controlar_personagens(true)


func encerrar_partida1():
	controlar_personagens(false)

	big_bro.parar_cursor()
	hud.hide()
	game_over1.show()
	
func encerrar_partida2():
	controlar_personagens(false)

	big_bro.parar_cursor()
	hud.hide()
	game_over2.show()	


func _on_botao_reiniciar_pressed():
	get_tree().reload_current_scene()
