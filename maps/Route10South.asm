	object_const_def
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2

Route10South_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

HikerJimAfterBattleText:
	text "Hay fever is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done


Route10SignText:
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	def_object_events
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
