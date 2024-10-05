extends Button

const COST = 1000

func _on_pressed():
	$"../ResultText".visible = true
	if CoreInfo.coins >= COST:
		var gambleNum = randi_range(1,10) # Roll a number
		
		# Coin Prize
		if gambleNum == 1: 
			CoreInfo.coins += 1000
			$"../ResultText".text = ("You won 1000 coins!")
			print("Coin prize!")
			
		# Mouse Steroids Prize
		elif gambleNum == 2: 
			CoreInfo.mouseSteroidsOwned += 1
			$"../ResultText".text = ("You won 1 Mouse Steroid!")
			CoreInfo.coins -= COST
			print("Mouse Steroids Prize!")
			
		# Gain somewhere between 1-10 mouse steroids
		elif gambleNum == 3: 
			CoreInfo.autoClickersOwned += 1
			$"../ResultText".text = ("You won 1 Auto Clicker!")
			CoreInfo.coins -= COST
			print("Auto Clicker Prize!")
			
		# Take gamble cost & do nothing
		else:
			CoreInfo.coins -= COST
			$"../ResultText".text = ("Nothing happened!")
			print("No Prize...")
		
	# Not enough coins
	else:
		$"../ResultText".text = ("You do not have enough coins to gamble!")
		print("Not enough coins!")
	CoreInfo.save() # Save game to prevent save-scumming
