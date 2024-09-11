extends Node2D

@onready var tile_map: TileMap = $TileMap
@onready var camera_2d: Camera2D = $Player/Camera2D


func _ready() -> void:
	var uesd := tile_map.get_used_rect().grow(-1)
	var tile_size := tile_map.tile_set.tile_size
	
	camera_2d.limit_top = uesd.position.y * tile_size.y
	camera_2d.limit_right = uesd.end.x * tile_size.x
	camera_2d.limit_bottom = uesd.end.y * tile_size.y
	camera_2d.limit_left = uesd.position.x * tile_size.x
	camera_2d.reset_smoothing()
