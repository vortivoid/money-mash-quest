extends LineEdit
@onready var secret_text = $"../Name Easter Egg Text"

var secret_names = {
	"No fucking way it's the person who made me wtffffff???": ["skye", "seppy"],
	"Fuck off commie.": ["charlac", "plaza", "charlacplaza"],
	"I SEE YOU.": ["charliecringe", "charlietheautisticlad"],
	"Which one though?": ["charlie"],
	"Shouldn't you be like, sailing the seas and discussing the economy?": ["imp", "string", "longingstring", "longingstring65"],
	"no way it's DrAgOn Ninja XYZmoc The Meme Thief!!1!": ["moc", "zmoc"],
	"Cheese Graters, Beans, and a Bin(fx). What more could one want?": ["finn", "finnfx"],
	"Second-hand automobile skyscraper stick insect rug": ["cosmo", "derser", "furrsa", "rug", "cosmothefox", "cosmothefoxxo", "cosmothefoxess"],
	"Damn girl, are you community storage? Because I wanna steal from you <3": ["niemond"],
	"Wow. How original.": ["name", "123", "abc"],
	"OMG THEY SAID IT THEY SAID THE THING!!!!": ["moneymashquest"],
	"There's no point saying anything, you won't read this anyway": ["goaty"],
	"Ooooo you like kissing boys you're a furry femboy boykisser ooooo": ["rev", "revqn"],
	"fortnite": ["fortnite"],
	"Do not fuck the kitchenware": ["kate", "katethepanplate", "thepanplate"],
	"I'm sorry to inform you, this game does not contain feet.": ["rexo"],
	"American more like American't, bro be smellin' like a sweaty aunt-": ["kc", "kc211", "kc_211"],
	"...Are you coming out to me or something?": ["gay", "lesbian", "bi", "bisexual", "trans", "transgender", "ace", "asexual", "aro", "aromantic", "genderfluid", "enby", "nonbinary", "non-binary"],
	"Wow you found it! It's the secret!!": ["secret"],
	"moths :3": ["lunar", "lunarmoths"],
	"This isn't a fucking undertale fangame why are you searching popular utdr content creators???": ["merg", "cibles", "shayy"],
	"brofist!": ["pewdiepie", "pewds"],
	"I'M THINKING MIKU MIKU OOOEEEOOO": ["miku", "hatsune", "hatsunemiku"],
	"OH GOD OH FUCK OH NO": ["herobrine"],
	"Well that's just rude": ["fuck", "shit", "dick", "cunt", "bitch"],
	"Neither do I lol": ["idk", "idfk", "idontknow", "idon'tknow"]
}



func _on_text_changed(new_text: String) -> void:
	print("text input")
	new_text = new_text.replace(" ","").to_lower()
	secret_text.text = ""
	
	if new_text == "dereton" or new_text == "gaster":
		get_tree().quit()
	
	for message in secret_names.keys():
		if new_text in secret_names[message]:
			secret_text.text = message
			return
		else:
			secret_text.text = ""
