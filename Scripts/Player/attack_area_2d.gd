extends Area2D

@onready var p = $".."
@onready var s = $"../AnimatedSprite2D"
@onready var c = $CollisionShape2D

func attack():
	if p.direction > 0:
		c.position.x = 12
	elif p.direction < 0:
		c.position.x = -12
	
	if p.curret_state == p.state.ATTACK:
		c.disabled = false
	elif p.curret_state != p.state.ATTACK:
		c.disabled = true
