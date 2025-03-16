extends Button

#Gamble Core Variables
@export_category("Core Values")
@export var cost = 1000
@export var win_number: int = 1
@export var roll_range: int = 10

#Gamble Prize Variables
@export_category("Prize Values")
@export var money_prize_amount: int = 0
@export var mouse_steroid_prize_amount: int = 0
@export var auto_clicker_prize_amount: int = 0
@export var gem_prize_amount: int = 0

#Enabled Prizes
@export_category("Enabled Prizes")
@export var money_prize_enabled: bool = false
@export var mouse_steroid_prize_enabled: bool = false
@export var auto_clicker_prize_enabled: bool = false
@export var gem_prize_enabled: bool = false

var enabled_prizes = []


func _ready() -> void:
	if money_prize_enabled:
		enabled_prizes.append("money")
	if mouse_steroid_prize_enabled:
		enabled_prizes.append("mousesteroid")
	if auto_clicker_prize_enabled:
		enabled_prizes.append("autoclicker")
	if gem_prize_enabled:
		enabled_prizes.append("gem")

	if enabled_prizes.size() == 0:
		print("No prizes enabled")
		return
	
	self.tooltip_text = ("Possible Prizes:\n" + str(money_prize_amount) + " money\n" + str(mouse_steroid_prize_amount) + " mouse steroids\n" + str(auto_clicker_prize_amount) + " auto clickers\n" + str(gem_prize_amount) + " gems")

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
	Globals.money += money_prize_amount
	$"../ResultText".text = ("You won " + str(money_prize_amount) + " money!")
	print("Coin prize!")

func mousesteroid_prize():
	Globals.mouseSteroidsOwned += mouse_steroid_prize_amount
	$"../ResultText".text = ("You won " + str(mouse_steroid_prize_amount) + " Mouse Steroid!")
	Globals.money -= cost
	print("Mouse Steroids Prize!")

func autoclicker_prize():
	Globals.autoClickersOwned += auto_clicker_prize_amount
	$"../ResultText".text = ("You won " + str(auto_clicker_prize_amount) + " Auto Clicker!")
	Globals.money -= cost
	print("Auto Clicker Prize!")

func gem_prize():
	Globals.gems += gem_prize_amount
	$"../ResultText".text = ("You won " + str(gem_prize_amount) + " Gems!")
	Globals.money -= cost
	print("Gem Prize!")
