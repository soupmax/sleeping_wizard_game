extends TileMapLayer

@export var camera : Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill_map()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func fill_map() -> void:
	var tile_size: int = 32
	var x_size: int = 12
	var y_size: int = 8
	
	if(camera != null):
		var vis_size = get_viewport_rect().size / camera.zoom
		
		var x_vis_tiles = floor(vis_size.x / tile_size)
		var y_vis_tiles = floor(vis_size.y / tile_size)
		
		x_size = int(floor(vis_size.x / tile_size) / 2)
		y_size = int(floor(vis_size.y / tile_size) / 2)
		print("yes cam: " + str(x_size) + "x * " + str(y_size) + "y")
	else:
		print("no cam")
	
	var size: int = 5
	
	for x in range(-x_size, x_size):
		for y in range(-y_size, y_size):
			##mark left row for debug
			if(x == -x_size):
				set_cell(Vector2i(x, y), 0, Vector2i(2, 0))				
			##mark right row for debug
			elif (x == x_size - 1):
				set_cell(Vector2i(x, y), 0, Vector2i(3, 0))
			##mark bottom row for debug
			elif (y == y_size - 1):
				set_cell(Vector2i(x, y), 0, Vector2i(3, 1))
			##mark top row for debug
			elif (y == -y_size):
				set_cell(Vector2i(x, y), 0, Vector2i(2, 1))
			##do not fill al cells (1 for debug, use smaller value for game
			elif randf() <= 1:
				##choose random tile from set
				var tile = Vector2i(randi_range(0, 1), randi_range(0, 1))
				set_cell(Vector2i(x,y), 0, tile)
				
			
		
