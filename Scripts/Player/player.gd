class_name Player
extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var direction : float = 0

@export var speed : float = 125
@export var aceleration : float = 625.0
@export var friction : float = 1000
@export var jump_velocity : float = -250.0
@export var gravity : float = 625.0
@export var fall_mult : float = 2.0

enum state{IDLE, WALK, JUMP, FALL, ATTACK}
@export var curret_state = state.IDLE

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("Left", "Right")
	change_state()
	run_state(_delta)
	sprite.update_sprite()
	
	move_and_slide()

func run_state(delta) -> void:
	match curret_state:
		state.IDLE:
			move_player_x(delta)
			move_player_y(delta)
		state.WALK:
			move_player_x(delta)
			move_player_y(delta)
		state.JUMP:
			move_player_x(delta)
			move_player_y(delta)
		state.FALL:
			move_player_x(delta)
			move_player_y(delta)
		state.ATTACK:
			pass

func change_state():
	if velocity.x == 0 and is_on_floor():
		curret_state = state.IDLE
	elif velocity.x != 0 and is_on_floor():
		curret_state = state.WALK
	elif velocity.y < 0 and not is_on_floor():
		curret_state = state.JUMP
	elif velocity.y > 0 and not is_on_floor():
		curret_state = state.FALL

func move_player_x(delta):
	if direction != 0:
		if velocity.x * direction < 0:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			friction * delta)
		else:
			velocity.x = move_toward(velocity.x, 
			speed * direction, 
			aceleration * delta)
	elif direction == 0:
		velocity.x = move_toward(velocity.x, 0, friction * delta)

func move_player_y(delta):
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
	
	if not is_on_floor():
		if velocity.y > 0:
			velocity.y += gravity * fall_mult * delta
		else:
			velocity.y += gravity * delta
