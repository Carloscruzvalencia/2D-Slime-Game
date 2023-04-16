extends CanvasLayer

var GoldCoins = 0
var SilverCoins = 0

func _ready():
	$Text/Counters/GoldCoinContador.text = str(GoldCoins)
	$Text/Counters/SilverCoinContador.text = str(SilverCoins)

func SilverCoinHandler():
	SilverCoins += 1
	$Text/Counters/SilverCoinContador.text = str(SilverCoins)
