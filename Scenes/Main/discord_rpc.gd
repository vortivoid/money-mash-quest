extends Node
func _ready():
	updateRPC()

func updateRPC():
	DiscordRPC.app_id = 1347518248274624552 # Application ID
	DiscordRPC.details = "Money: " + str(CoreInfo.coins)
	DiscordRPC.large_image = "mmq-money-icon" # Image key from "Art Assets"
	DiscordRPC.large_image_text = "Money: " + str(CoreInfo.coins)
	DiscordRPC.small_image = "gemicon" # Image key from "Art Assets"
	DiscordRPC.small_image_text = "Gems: " + str(CoreInfo.gems)
	
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
	# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"
	
	DiscordRPC.refresh() # Always refresh after changing the values!
