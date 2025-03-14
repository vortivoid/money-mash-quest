extends Button
const COST = 1000

func _on_pressed():
	$"../ResultText".visible = true
	if Globals.money >= COST:
		var gambleNum = randi_range(1,10) # Roll a number
		
		# Coin Prize
		if gambleNum == 1: 
			Globals.money += 1000
			$"../ResultText".text = ("You won 1000 money!")
			print("Coin prize!")
			
		# Mouse Steroids Prize
		elif gambleNum == 2: 
			Globals.mouseSteroidsOwned += 1
			$"../ResultText".text = ("You won 1 Mouse Steroid!")
			Globals.money -= COST
			print("Mouse Steroids Prize!")
			
		# Gain somewhere between 1-10 mouse steroids
		elif gambleNum == 3: 
			Globals.autoClickersOwned += 1
			$"../ResultText".text = ("You won 1 Auto Clicker!")
			Globals.money -= COST
			print("Auto Clicker Prize!")
			
		# Take gamble cost & do nothing
		else:
			Globals.money -= COST
			$"../ResultText".text = ("Nothing happened!")
			print("No Prize...")
		$AudioStreamPlayer2D.play()
		
	# Not enough money
	else:
		$"../ResultText".text = ("You do not have enough money to gamble!")
		print("Not enough money!")
	Globals.save() # Save game to prevent save-scumming
