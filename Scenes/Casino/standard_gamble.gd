extends Button

const COST = 10000

func _on_pressed():
	$"../ResultText".visible = true
	if Globals.money >= COST:
		var gambleNum = randi_range(1,10) # Roll a number
		
		# Coin Prize
		if gambleNum == 1: 
			Globals.money += 10000
			$"../ResultText".text = ("You won 10,000 money!")
			print("Coin prize!")
			
		# Mouse Steroids Prize
		elif gambleNum == 2: 
			var randMouseSteroidsNum = randi_range(10,15)
			Globals.mouseSteroidsOwned += randMouseSteroidsNum
			$"../ResultText".text = ("You won " + str(randMouseSteroidsNum) + " Mouse Steroids!")
			Globals.money -= COST
			print("Mouse Steroids Prize!")
			
		# Gain somewhere between 1-10 mouse steroids
		elif gambleNum == 3: 
			var randAutoClickerNum = randi_range(10,15)
			Globals.autoClickersOwned += randAutoClickerNum
			$"../ResultText".text = ("You won " + str(randAutoClickerNum) + " Auto Clickers!")
			Globals.money -= COST
			print("Auto Clicker Prize!")
			
		elif gambleNum ==4:
			var randGemNum = randi_range(1,3)
			Globals.gems += randGemNum
			$"../ResultText".text = ("You won " + str(randGemNum) + " Gems!")
			Globals.money -= COST
			print("Gem Prize!")
		
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
