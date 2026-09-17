extends AnimatedSprite2D

@onready var p = $".."

@export var combo : int = 1

func update_sprite():
	if p.curret_state == p.state.IDLE:
		play("Idle")
	elif p.curret_state == p.state.WALK:
		play("Walk")
	elif p.curret_state == p.state.JUMP:
		play("Jump")
	elif p.curret_state == p.state.FALL:
		play("Fall")
	elif p.curret_state == p.state.ATTACK:
		if not p.is_on_floor():
			play("Air Attack")
		if p.is_on_floor():
			if combo == 1:
				play("Attack1")
			elif combo == 2:
				play("Attack2")
			elif combo == 3:
				play("Attack3")
		
		
	if p.direction != 0:
		flip_h = (p.direction < 0) 


func _on_animation_finished() -> void:
	if p.curret_state == p.state.ATTACK:
		if combo == 3:
			combo = 1
		else:
			combo += 1
		p.curret_state = p.state.IDLE
