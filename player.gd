extends CharacterBody2D


const SPEED = 30.0
@onready var animated_sprite = $AnimatedSprite2D
var lastM = 0
func _physics_process(_delta: float) -> void:

	# Handle jump.
	var ydirection := Input.get_axis("ui_up", "ui_down")
	if ydirection:
		velocity.y = ydirection * SPEED
		lastM = ydirection*2
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		lastM = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if ydirection == 1:
		animated_sprite.play("walkFRONT")
	elif ydirection == -1:
		animated_sprite.play("walkBACK")
	elif direction == 1:
		animated_sprite.play("walkRIGHT")
	elif direction == -1:
		animated_sprite.play("walkLEFT")
	else:
		if lastM == 2:
			animated_sprite.play("defaultFRONT")
		elif lastM == -2:
			animated_sprite.play("defaultBACK")
		elif lastM == 1:
			animated_sprite.play("defaultRIGHT")
		elif lastM == -1:
			animated_sprite.play("defaultLEFT")
		else:
			animated_sprite.play("defaultFRONT")
		
	move_and_slide()
