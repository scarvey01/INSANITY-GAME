extends StaticBody3D

var cactusScene = preload("res://cactus.tscn")

func spawnCacti() -> void:
	for x in range(-45, 45, 5):
		for y in range(-45, 45, 5):
			if randi_range(1, 10) == 1:
				var cactusInstance = cactusScene.instantiate()
				cactusInstance.position = Vector3(x, 0, y)
				cactusInstance.rotation_degrees = Vector3(0, randf_range(0, 360), 0)
				add_child(cactusInstance)
				# print("Cactus spawned at:", cactusInstance.position)

func _ready() -> void:
	spawnCacti()
