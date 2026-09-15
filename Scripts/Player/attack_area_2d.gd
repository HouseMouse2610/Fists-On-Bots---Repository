extends Area2D
# o que tem que ter:
# Segurar o botão faz atacar sem parar
# Durante o ataque, não pode pular, e se move em x mais devagar
# Quando terminar o ataque, vai pra IDLE
@onready var p = $".."
@onready var s = $"../AnimatedSprite2D"
@onready var c = $CollisionShape2D

func attack():
	# tem que fazer o flip h do x
	# tem que dizer quando c é disabled
	pass
