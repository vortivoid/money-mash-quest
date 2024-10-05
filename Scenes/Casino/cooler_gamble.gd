extends Button

const COST = 100000

func _on_pressed():
	$"../ResultText".visible = true
	if CoreInfo.coins >= COST:
		var gambleNum = randi_range(1,10) # Roll a number
		
		# Coin Prize
		if gambleNum == 1: 
			CoreInfo.coins += 100000
			$"../ResultText".text = ("You won 100,000 coins!")
			print("Coin prize!")
			
		# Mouse Steroids Prize
		elif gambleNum == 2: 
			var randMouseSteroidsNum = randi_range(100,200)
			CoreInfo.mouseSteroidsOwned += randMouseSteroidsNum
			$"../ResultText".text = ("You won " + str(randMouseSteroidsNum) + " Mouse Steroids!")
			CoreInfo.coins -= COST
			print("Mouse Steroids Prize!")
			
		# Gain somewhere between 1-10 mouse steroids
		elif gambleNum == 3: 
			var randAutoClickerNum = randi_range(100,200)
			CoreInfo.autoClickersOwned += randAutoClickerNum
			$"../ResultText".text = ("You won " + str(randAutoClickerNum) + " Auto Clickers!")
			CoreInfo.coins -= COST
			print("Auto Clicker Prize!")
			
		elif gambleNum == 4:
			var randGemNum = randi_range(30,50)
			CoreInfo.gems += randGemNum
			$"../ResultText".text = ("You won " + str(randGemNum) + " Gems!")
			CoreInfo.coins -= COST
			print("Gem Prize!")
		
		
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
