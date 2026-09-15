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
		#if not p.is_on_floor():
			#play("Air Attack")
			#combo = 1
		if combo == 1: # el faltando pra ficar elif
			play("Attack1")
			#combo = 2
		#elif combo == 2:
			#play("Attack2")
			#combo = 3
		#elif combo == 3:
			#play("Attack3")
			#combo = 1
		
		
	if p.direction != 0:
		flip_h = (p.direction < 0) 


func _on_animation_finished() -> void:
	pass
