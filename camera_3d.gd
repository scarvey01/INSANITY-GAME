extends Camera3D

const ROTATE_ANGLE := deg_to_rad(180)
const ROTATE_SPEED := 20.0  # Radians per second

var rotating = false
var remaining_rotation = 0.0
var looking_back = false  # Keeps track of camera rotation
var rotation_direction = 1.0

func _ready():
	current = true

func _process(delta):
	if not rotating and Input.is_action_just_pressed("ui_right"):
		rotating = true
		remaining_rotation = ROTATE_ANGLE
		rotation_direction = -1.0 if not looking_back else 1.0
		looking_back = !looking_back  # cahnges bool to whatever its not

	if rotating:
		var step = ROTATE_SPEED * delta
		if step > remaining_rotation:
			step = remaining_rotation

		rotate_y(step * rotation_direction)
		remaining_rotation -= step

		if remaining_rotation <= 0.0:
			rotating = false
#func _input(event):
#if event is InputEventKey and event.pressed:
#if event.keycode == KEY_RIGHT:
#turn_right()
#print("turning")
