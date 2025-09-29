extends Node
@export var CuboMorte : PackedScene
@export var CuboPadrao : PackedScene

var cuboAtivo : Node3D
var pontos = 0
var rng = RandomNumberGenerator.new()
var TEMPO = 5
var tempo = 0;

func _ready() -> void:
	cuboAtivo = CuboPadrao.instantiate()
	add_child(cuboAtivo)

func novoCubo() -> void:
	cuboAtivo.queue_free()
	
	var randVal = rng.randf_range(0.0, 1.0)
	if (randVal > 0.8):
		cuboAtivo = CuboMorte.instantiate()
	else:
		cuboAtivo = CuboPadrao.instantiate()
		
	var randX = rng.randf_range(-6.0,6.0)
	var randY = rng.randf_range(-3,3)
	
	var pos = Vector3(randX,randY, 0)
	cuboAtivo.position = pos
	
	add_child(cuboAtivo)	
	
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		if (cuboAtivo.name == 'CuboMorte'):
			print ("Pontuacao: " + str(pontos))
		else:
			pontos += 1
		novoCubo()
		tempo = 0
	tempo += 1 * delta
	if(tempo > TEMPO):
		novoCubo() 
		tempo = 0
