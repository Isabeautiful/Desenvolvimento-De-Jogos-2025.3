extends Node2D

var botoes : Array
var sequencia : Array
var tamanho_sequencia = 3
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	botoes.append($Node)
	botoes.append($Node2)
	botoes.append($Node3)
	botoes.append($Node4)
	

func novo_jogo() -> void:
	sequencia.clear()
	sequencia.append($Node2)
	
