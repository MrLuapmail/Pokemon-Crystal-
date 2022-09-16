farcall: MACRO ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

newfarcall: MACRO ; bank, address
; We can't replace previous farcalls because it breaks saves...
	rst BetterFarCall
	dbw BANK(\1), \1
ENDM

newfarjp: MACRO
	rst BetterFarCall
	dbw BANK(\1) | $80, \1
ENDM

callfar: MACRO ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
ENDM

homecall: MACRO
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
