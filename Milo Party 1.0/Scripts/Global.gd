extends Node2D

onready var genesis = $Genesis
onready var crimewave = $Crimewave
onready var tameimpala = $TameImpala
onready var ifollowrivers = $IFollowRivers
var npc_nearly = false
var status
var music
var personagem
var task1 = false
var task2 = false
var task3 = false
var money = 27

func musicVolume(song):
	if song == "genesis":
		music = $Genesis
	elif song == "crimewave":
		music = $Crimewave
	elif song == "tameimpala":
		music = $TameImpala
	elif song == "ifollowrivers":
		music = $IFollowRivers
	while music.volume_db > -80:
		music.volume_db -= 1
		yield(get_tree().create_timer(0.04), "timeout") 
