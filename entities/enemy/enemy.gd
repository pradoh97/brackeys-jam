extends Area2D

@export_dir var sprites_folder = "res://assets/enemies/food-pack-2/"

func _ready():
	set_random_sprite()

func set_random_sprite():
	var files_in_folder : Array = DirAccess.open(sprites_folder).get_files()
	var sprites_file_names : Array = files_in_folder.filter(func(file_name : String): return not file_name.contains(".import"))

	$Sprite2D.texture = load(sprites_folder + sprites_file_names.pick_random())
