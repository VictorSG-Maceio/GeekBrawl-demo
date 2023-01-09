extends CanvasLayer

var player

func _ready():
	player = get_parent().get_node("Player")
	$LifeBar.max_value = player.life_max
	$LifeBar.min_value = 0
	
	$Energy.max_value = player.energy_max
	$Energy.min_value = 0

func _process(delta):
	$LifeBar.value = player.life
	$Energy.value = player.energy
