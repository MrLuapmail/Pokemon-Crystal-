	object_const_def
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerE4Will:
	trainer WILL, WILL2, EVENT_BEAT_REMATCH_WILL, RematchWillSeenText, RematchWillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RematchWillAfterBattleText
	waitbutton
	closetext
	end

TrainerE4Koga:
	trainer KOGA, KOGA2, EVENT_BEAT_REMATCH_KOGA, RematchKogaSeenText, RematchKogaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RematchKogaAfterBattleText
	waitbutton
	closetext
	end

TrainerE4Bruno:
	trainer BRUNO, BRUNO2, EVENT_BEAT_REMATCH_BRUNO, RematchBrunoSeenText, RematchBrunoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RematchBrunoAfterBattleText
	waitbutton
	closetext
	end

TrainerE4Karen:
	trainer KAREN, KAREN2, EVENT_BEAT_REMATCH_KAREN, RematchKarenSeenText, RematchKarenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RematchKarenAfterBattleText
	waitbutton
	closetext
	end

RematchWillSeenText:
	text "<……>"
	line "<……>"
	done

RematchWillBeatenText:
	text "<……>"
	line "<……>"
	done

RematchWillAfterBattleText:
	text "<……>"
	line "<……>"
	done

RematchKogaSeenText:
	text "<……>"
	line "<……>"
	done

RematchKogaBeatenText:
	text "<……>"
	line "<……>"
	done

RematchKogaAfterBattleText:
	text "<……>"
	line "<……>"
	done

RematchBrunoSeenText:
	text "<……>"
	line "<……>"
	done

RematchBrunoBeatenText:
	text "<……>"
	line "<……>"
	done

RematchBrunoAfterBattleText:
	text "<……>"
	line "<……>"
	done

RematchKarenSeenText:
	text "<……>"
	line "<……>"
	done

RematchKarenBeatenText:
	text "<……>"
	line "<……>"
	done

RematchKarenAfterBattleText:
	text "<……>"
	line "<……>"
	done

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "<……>"
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 31, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_WILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 6, TrainerE4Will, -1
	object_event  4, 10, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerE4Koga, -1
	object_event 16,  8, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerE4Bruno, -1
	object_event  5,  6, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerE4Karen, -1
	object_event  9,  0, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
