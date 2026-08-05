class_name RawCreature
extends Node2D

@export var frame_count: int = 4
@export var frame_size: int = 32
@export var moveable: bool = true

var health: int = 10
var speed: int = 0

var timeSinceLastMove = 1;


@onready var animator = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(health <= 0):
		die()
	if(moveable):
		move_creature(delta)
		pass
	
func initialize(_type: String) -> void:
	##print_debug("type: " + _type)
	name = _type
	var sheet: Texture2D

	match _type:
		"ant":
			sheet = preload("res://sprites/creatures/ant/ant_walk.png")
			animator.rotation_degrees= 90
			health = 20
			speed = 2
		"book":
			sheet = preload("res://sprites/creatures/book/book_idle.png")
		"bee":
			sheet = preload("res://sprites/creatures/bee/bee_walk.png")
			animator.rotation_degrees= 90
			health = 10
			speed = 1
		"frog":
			sheet = preload("res://sprites/creatures/frog/frog_walk.png")
			animator.rotation_degrees= 90
			health = 30
			speed = 4
	var frames = SpriteFrames.new()
	frames.add_animation("walk")

	for i in range(frame_count):
		var frame = AtlasTexture.new()		
		frame.atlas = sheet
		frame.region = Rect2(i * frame_size, 0, frame_size, frame_size)
		frames.add_frame("walk", frame)

	animator.sprite_frames = frames
	animator.play("walk")
	for i in range(frame_count):
		var region = Rect2(i * frame_size, 0, frame_size, frame_size)
		##print(region)
	pass
	
func move_creature(delta: float) -> void:
	timeSinceLastMove -= delta
	if timeSinceLastMove <= 0:
		timeSinceLastMove = speed
		position.x += 32

func die() -> void:
	queue_free()
