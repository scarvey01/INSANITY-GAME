extends StaticBody3D

var cactus_1 = preload("res://cactus1.tscn")
var cactus_2 = preload("res://cactus2.tscn")

var cacti = [cactus_1, cactus_2]

func spawnCacti() -> void:
	for x in range(-45, 45, 5):
		for y in range(-45, 45, 5):
			if randi_range(1, 10) == 1:
				var cactusInstance = cacti[randi_range(0, 1)].instantiate()
				cactusInstance.position = Vector3(x, 0, y)
				cactusInstance.rotation_degrees = Vector3(0, randf_range(0, 360), 0)
				add_child(cactusInstance)
				# print("Cactus spawned at:", cactusInstance.position)

func _ready() -> void:
	spawnCacti()
