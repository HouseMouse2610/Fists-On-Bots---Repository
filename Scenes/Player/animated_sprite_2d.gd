extends AnimatedSprite2D

@onready var p = $".."

func update_sprite():
	if p.curret_state == p.state.IDLE:
		play("Idle")
	elif p.curret_state == p.state.WALK:
		play("Walk")
	elif p.curret_state == p.state.JUMP:
		play("Jump")
	elif p.curret_state == p.state.FALL:
		play("Fall")
	if p.direction != 0:
		flip_h = (p.direction < 0) 
