TrainerClassAttributes:
; entries correspond to trainer classes (see constants/trainer_constants.asm)
	table_width NUM_TRAINER_ATTRIBUTES, TrainerClassAttributes

; Falkner
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Whitney
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Bugsy
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Morty
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Pryce
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Jasmine
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Chuck
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Clair
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Rival1
	db NO_ITEM, NO_ITEM ; items
	db 15 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Pokemon Prof
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Will
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Cal
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Bruno
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN
	
; Karen
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Koga
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Champion
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Brock
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Misty
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS | AI_RISKY
	dw CONTEXT_USE | SWITCH_OFTEN

; Lt Surge
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Scientist
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Erika
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Youngster
	db NO_ITEM, NO_ITEM ; items
	db 4 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Schoolboy
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Bird Keeper
	db NO_ITEM, NO_ITEM ; items
	db 6 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Lass
	db NO_ITEM, NO_ITEM ; items
	db 6 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Janine
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Cooltrainerm
	db NO_ITEM, NO_ITEM ; items
	db 12 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Cooltrainerf
	db NO_ITEM, NO_ITEM ; items
	db 12 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Beauty
	db NO_ITEM, NO_ITEM ; items
	db 22 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Pokemaniac
	db NO_ITEM, NO_ITEM ; items
	db 15 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Gruntm
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Gentleman
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Skier
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Teacher
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Sabrina
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Bug Catcher
	db NO_ITEM, NO_ITEM ; items
	db 4 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Fisher
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Swimmerm
	db NO_ITEM, NO_ITEM ; items
	db 2 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Swimmerf
	db NO_ITEM, NO_ITEM ; items
	db 5 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Sailor
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Super Nerd
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Rival2
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Guitarist
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Hiker
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Biker
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Blaine
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Burglar
	db NO_ITEM, NO_ITEM ; items
	db 22 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Firebreather
	db NO_ITEM, NO_ITEM ; items
	db 12 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Juggler
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Blackbelt T
	db NO_ITEM, NO_ITEM ; items
	db 6 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Executivem
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Psychic T
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Picnicker
	db NO_ITEM, NO_ITEM ; items
	db 5 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Camper
	db NO_ITEM, NO_ITEM ; items
	db 5 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Executivef
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Sage
	db NO_ITEM, NO_ITEM ; items
	db 8 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Medium
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Boarder
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Pokefanm
	db NO_ITEM, NO_ITEM ; items
	db 20 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Kimono Girl
	db NO_ITEM, NO_ITEM ; items
	db 18 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Twins
	db NO_ITEM, NO_ITEM ; items
	db 5 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Pokefanf
	db NO_ITEM, NO_ITEM ; items
	db 20 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Red
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Blue
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_OFTEN

; Officer
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Gruntf
	db NO_ITEM, NO_ITEM ; items
	db 10 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

; Mysticalman
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_SMART | AI_AGGRESSIVE | AI_STATUS 
	dw CONTEXT_USE | SWITCH_SOMETIMES

	assert_table_length NUM_TRAINER_CLASSES
