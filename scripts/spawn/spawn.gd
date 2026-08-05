extends Node2D

@export var enemyParent: Node2D
@export var spawnTimer: int = 4


var spawnPos: Array[int] = []
var tmr: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	intitialize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(tmr >= 0):
		tmr -= delta
	else:
		tmr = 1
		spawn_creature()
	
	
func intitialize():
	create_positions()

func create_positions() -> void:
	spawnPos = []
	for i in range(-400, 401, 32):
		spawnPos.append(i)

func spawn_creature()-> void:
	var spawnY = spawnPos.pick_random()
	var creature_prefab = preload("res://scenes/prefabs/RawCreature.tscn")
	var creature: RawCreature = creature_prefab.instantiate()
	enemyParent.add_child(creature)
	creature.position = Vector2(position.x, spawnY)
	creature.initialize("ant")
	
