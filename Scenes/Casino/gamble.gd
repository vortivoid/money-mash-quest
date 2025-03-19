extends Button

#Gamble Core Variables
@export_category("Core Values")
@export var cost = 1000
@export var win_number: int = 1
@export var roll_range: int = 10

#Gamble Prize Variables
@export_category("Prize Amounts")
@export_group("Money")
@export var min_money_prize: int = 0
@export var max_money_prize: int = 0
@export_group("Mouse Steroid")
@export var min_mouse_steroid_prize: int = 0
@export var max_mouse_steroid_prize: int = 0
@export_group("Auto Clicker")
@export var min_auto_clicker_prize: int = 0
@export var max_auto_clicker_prize: int = 0
@export_group("Gem")
@export var min_gem_prize: int = 0
@export var max_gem_prize: int = 0

#Enabled Prizes
@export_category("Enabled Prizes")
@export var money_prize_enabled: bool = false
@export var mouse_steroid_prize_enabled: bool = false
@export var auto_clicker_prize_enabled: bool = false
@export var gem_prize_enabled: bool = false

var enabled_prizes = []
var tooltip_message = "Possible prizes:\n"



func _ready() -> void:
	if money_prize_enabled:
		enabled_prizes.append("money")
		tooltip_message += (str(min_money_prize) + "-" + (str(max_money_prize)) + " money\n")
	if mouse_steroid_prize_enabled:
		enabled_prizes.append("mousesteroid")
		tooltip_message += (str(min_mouse_steroid_prize) + "-" + (str(max_mouse_steroid_prize)) + " mouse steroids\n")
	if auto_clicker_prize_enabled:
		enabled_prizes.append("autoclicker")
		tooltip_message += (str(min_auto_clicker_prize) + "-" + (str(max_auto_clicker_prize)) + " auto clickers\n")
	if gem_prize_enabled:
		enabled_prizes.append("gem")
		tooltip_message += (str(min_gem_prize) + "-" + (str(max_gem_prize)) + " gems\n")

	if enabled_prizes.size() == 0:
		print("No prizes enabled")
		return
	
	tooltip_text = tooltip_message



func _on_pressed():
	$"../ResultText".visible = true
	if Globals.money >= cost:
		var gambleNum = randi_range(1,roll_range) # Roll a number
		
		#Prize
		if gambleNum == win_number: 
			roll_prize()
			$"../victorySFX".play()
		
		# Take gamble cost & do nothing
		else:
			Globals.money -= cost
			$"../ResultText".text = ("FAIL: Better luck next time!")
			print("No Prize...")
			$"../failSFX".play()
		
	# Not enough money
	else:
		$"../ResultText".text = ("You do not have enough money to gamble!")
		print("Not enough money!")
	Globals.save() # Save game to prevent save-scumming



func roll_prize():
	var random_index = randi_range(0, (enabled_prizes.size() - 1))
	var selected_prize = enabled_prizes[random_index]
	var method_name = selected_prize + "_prize"
	if has_method(method_name):
		call(method_name)
	else:
		print("No method found for: " + method_name)



func money_prize():
	var money_prize = randi_range(min_money_prize, max_money_prize)
	Globals.money += money_prize
	$"../ResultText".text = ("You won " + str(money_prize) + " money!")
	print("Coin prize!")

func mousesteroid_prize():
	var mouse_steroid_prize = randi_range(min_mouse_steroid_prize, max_mouse_steroid_prize)
	Globals.mouseSteroidsOwned += mouse_steroid_prize
	$"../ResultText".text = ("You won " + str(mouse_steroid_prize) + " Mouse Steroid!")
	Globals.money -= cost
	print("Mouse Steroid Prize!")

func autoclicker_prize():
	var auto_clicker_prize = randi_range(min_auto_clicker_prize, max_auto_clicker_prize)
	Globals.autoClickersOwned += auto_clicker_prize
	$"../ResultText".text = ("You won " + str(auto_clicker_prize) + " Auto Clicker!")
	Globals.money -= cost
	print("Auto Clicker Prize!")

func gem_prize():
	var gem_prize = randi_range(min_gem_prize, max_gem_prize)
	Globals.gems += gem_prize
	$"../ResultText".text = ("You won " + str(gem_prize) + " Gems!")
	Globals.money -= cost
	print("Gem Prize!")
