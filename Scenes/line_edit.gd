extends LineEdit
@onready var secret_text = $"../Name Easter Egg Text"

var secret_names = {
	"No fucking way it's the person who made me wtffffff???": ["skye", "seppy", "sepskye"],
	"Fuck off commie.": ["charlac", "plaza", "charlacplaza", "lorddeathkiller"],
	"I SEE YOU.": ["charliecringe", "charlietheautisticlad"],
	"Which one though?": ["charlie"],
	"Shouldn't you be like, sailing the seas and discussing the economy?": ["imp", "string", "longingstring", "longingstring65"],
	"no way it's DrAgOn Ninja XYZmoc The Meme Thief!!1!": ["moc", "zmoc"],
	"Cheese Graters, Beans, and a Bin(fx). What more could one want?": ["finn", "finnfx", "binfx"],
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
	"Neither do I lol": ["idk", "idfk", "idontknow", "idon'tknow"],
	"Fear.": ["blubby"],
	"The bread kind or the cloth wearing death spirit kind?": ["crumpet"],
	"My babyyy": ["twiggy"],
	"Lulu will remember this betrayal": ["auru"],
	"Auru will remember this betrayal": ["lulu"],
	"...i hate you": ["legends77", "legends77yt"],
	"I know": ["iloveyou"],
	"You're really trying hard to find these secret messages, aren't ya": ["yourname?"],
	"(you feel a chilling breeze...)": ["invail", "theinvail"],
	"Krydos > Crimzan": ["zekronia"],
	"Idk enough abt the lore to make a witty remark here": ["flotopia", "flonia", "flonianisles"],
	"HAR HAR HARHAR HAR HAR HARHAR HAR HARRRRR": ["freddy", "freddyfazbear", "fazbear"],
	"Stop gooning on a clicker game": ["frenni", "meru", "bonfie", "chiku", "fexa"],
	"I am placing blocks and shit cuz I'm in fucking Minecraafft": ["minecraft"],
	"I.... AM STEVE!": ["steve"],
	"Idk that's why I'm asking you": ["whatismyname", "whatismyname?"],
	"??????????????": ["?", "??", "???", "????", "?????", "??????", "???????", "????????", "?????????", "??????????", "???????????", "????????????", "?????????????", "??????????????", "???????????????"],
	"Maximum confusion reached": ["????????????????"],
	"Please get some taste": ["warthunder"],
	"I fear the Nintendo Ninjas will assasinate me if I say anything wrong here": ["mario", "luigi", "peach", "bowser", "toad", "yoshi"],
	"Damn, if only there wasn't a 16 character limit, then i'dve been able to give you a fun witty remark about Brum Brum Simulator. Alas, I cannot.": ["brumbrumsimulato"],
	"Wohohohohoooooooooaaahohohohoooooahoohoo story of undertaleeee": ["undertale"],
	"Maybe it's the way you're dressed?": ["sans"],
	"NYEH HEH HEH!": ["papyrus"],
	"yea, i am": ["funny"],
	":3": [":3"],
	"Fuckin' furry": [">w<", "owo"],
	"Fuckin' weeb": ["uwu"],
	"Crazy? I was crazy once.": ["crazy"],
	"You feel an evil presence watching you": ["terraria"],
	"A GOD DOES NOT FEAR DEATH!": ["calamity"]
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
