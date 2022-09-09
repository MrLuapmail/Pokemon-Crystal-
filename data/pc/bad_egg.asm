BadEgg:
; Failsafe if there is a checksum error
	db BULBASAUR ; Species
	db NO_ITEM ; Item
	db POUND, NO_MOVE, NO_MOVE, NO_MOVE ; Moves
	dw 0 ; OTID
	db 0, 0, 0 ; Exp
	dw 0, 0, 0, 0, 0 ; Stat Exp
	dw 0 ; DVs
	db 0, 0, 0, 0 ; PP
	db 255 ; Egg cycles
	db 0 ; Pokérus
	db 0, 0 ; Caught info
	db EGG_LEVEL ; Level
	db 0 ; Status problem
	db 0 ; unused
	dw 0, 11 ; HP/MaxHP
	dw 5, 5, 5, 5, 5 ; The other stats
	db EGG ; Alt species
	db "BAD EGG@@@@" ; Nickname
	db "?@@@@@@@@@@" ; OT name
BadEggEnd:
