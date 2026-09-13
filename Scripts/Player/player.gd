class_name Player
extends CharacterBody2D

var direction := 0

@export var speed : float = 125
@export var aceleration : float = 750.0
@export var friction : float = 1000
@export var jump_velocity : float = -250.0
@export var gravity : float = 600.0

enum state{IDLE, WALK, JUMP, FALL, ATTACK}
var curret_state = state.IDLE
