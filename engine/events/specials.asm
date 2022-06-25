Special::
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

INCLUDE "data/events/special_pointers.asm"

DamageMon:
	call DisableSpriteUpdates
.select_mon
    farcall SelectTradeOrDayCareMonWithoutReturningToMap
    jp c, .ShadyGuyExit
    ld a, [wCurPartySpecies]
    cp EGG
    jp z, .Egg
	
	ld d, a
	ld hl, wPartyMon1Species
.find_target_mon
	ld a, [hl]
	cp d
	jr z, .damage
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	jr .find_target_mon
	
.damage
	push hl
	ld hl, .ShadyGuyDealDamage
	call PrintText
	
	call HowMuchDamage
	pop hl
	jr c, .select_mon
	
	; Deal damage
	ld bc, MON_MAXHP
	add hl, bc
	
	; Multiply by $ff
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hl]
	ldh [hMultiplicand + 1], a
	inc hl
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, $ff
	ldh [hMultiplier], a
	call Multiply
	
	; Multiply by the percent value of d
	ld a, d
	ldh [hMultiplier], a
	call Multiply
	 
	; Divide by 100 to complete HP * d%
	ld a, 100
	ld [hDivisor], a
	ld b, 3
	call Divide
	
	dec hl
	dec hl
	dec hl
	ldh a, [hQuotient + 2]
	and a
	jr z, .cont
	ldh a, [hQuotient + 2]
	cp [hl]
	jr nc, .error_damaging
	
.cont
	
	inc hl
	ldh a, [hQuotient + 3]
	inc a
	cp [hl]
	jr nc, .error_damaging
	
	push hl
	push af
	; HP bar animation stuff
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer2 + 1], a
	ld a, [hl]
	ld [wHPBuffer2], a
	pop af
	pop hl
	
	ld b, a
	ld a, [hRemainder]
	and a
	jr z, .damaging
	
	; If there is a remainder, carry it.
	inc b
	
.damaging
	
	; Damaging the Pokémon
	ld a, b
	dec a
	ld [hl], a
	dec hl
	ldh a, [hQuotient + 2]
	ld [hl], a
	
	; More HP bar animation stuff
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	ld [wHPBuffer3 + 1], a
	ld a, [hl]
	ld [wHPBuffer3], a
	
	ld de, SFX_DAMAGE
	call WaitPlaySFX
	
	; Actual HP bar animation
	ld a, [wCurPartyMon]
	hlcoord 11, 0
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld a, $2
	ld [wWhichHPBar], a
	predef AnimateHPBar
	
	ld hl, .ShadyGuyDamageDone
	call PrintText
	jp .select_mon

.error_damaging:
	ld de, SFX_BUMP
	call WaitPlaySFX
	
	ld hl, .ShadyGuyDamageError
	call PrintText
	jp .select_mon
	
.Egg:
	ld de, SFX_BUMP
	call WaitPlaySFX

    ld hl, .ShadyGuyEgg
	call PrintText
	jp .select_mon

	
.ShadyGuyExit:
	call ReturnToMapWithSpeechTextbox
	call EnableSpriteUpdates
	ret
	
.ShadyGuyDamageError:
	text_far _ShadyGuyDamageError
	text_end
	
.ShadyGuyDealDamage:
	text_far _ShadyGuyDealDamage
	text_end	
	
.ShadyGuyDamageDone:
	text_far _ShadyGuyDamageDone
	text_end
	
.ShadyGuyEgg:
	text_far _ShadyGuyEgg
	text_end
	
HowMuchDamage:
	ld hl, Damage_MenuHeader
	call LoadMenuHeader
	call Damage_Loop
	ld a, [wItemQuantityChange]
	ld d, a
	ret

Damage_Loop:
	ld a, 99
	ld [wItemQuantityChange], a
.loop
	call Damage_UpdateDamageDisplay		; update display
	call Damage_InterpretJoypad     	; joy action
	jr nc, .loop
	cp -1
	jr nz, .nope ; pressed B
	scf
	ret

.nope
	and a
	ret
	
Damage_InterpretJoypad:
	call JoyTextDelay_ForcehJoyDown ; get joypad
	bit B_BUTTON_F, c
	jr nz, .b
	bit A_BUTTON_F, c
	jr nz, .a
	bit D_DOWN_F, c
	jr nz, .down
	bit D_UP_F, c
	jr nz, .up
	bit D_LEFT_F, c
	jr nz, .left
	bit D_RIGHT_F, c
	jr nz, .right
	and a
	ret

.b
	ld a, -1
	scf
	ret

.a
	ld a, 0
	scf
	ret

.down
	ld hl, wItemQuantityChange
	ld a, [hl]
	dec a
	dec a
	cp 99
	jr c, .finish_down
	ld a, 0

.finish_down
	inc a
	ld [hl], a
	and a
	ret

.up
	ld hl, wItemQuantityChange
	ld a, [hl]
	inc a
	ld [hl], a
	cp 99
	jr c, .finish_up
	ld [hl], 99

.finish_up
	and a
	ret

.left
	ld a, [wItemQuantityChange]
	sub 10
	jr c, .load_01
	jr z, .load_01
	jr .finish_left

.load_01
	ld a, 1
.finish_left
	ld [wItemQuantityChange], a
	and a
	ret

.right
	ld a, [wItemQuantityChange]
	add 10
	cp 99
	jr c, .finish_right
	ld a, 99

.finish_right
	ld [wItemQuantityChange], a
	and a
	ret

Damage_UpdateDamageDisplay:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	inc hl
	inc hl
	ld [hl], "<PERCENT>"
	dec hl
	dec hl
	ld de, wItemQuantityChange
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wMenuDataPointer]
	ld e, a
	ld a, [wMenuDataPointer + 1]
	ld d, a
	ld a, [wMenuDataBank]
	call FarCall_de
	ret
	
Damage_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 15, 9, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NothingToDisplay
	db 0 ; default option


PoisonOrParaDone:
	text_far _PoisonOrParaComplete
	text_end

PoisonMon:
	call DisableSpriteUpdates
.select_mon
    farcall SelectTradeOrDayCareMonWithoutReturningToMap
    jp c, .PoisonExit
    ld a, [wCurPartySpecies]
    cp EGG
    jp z, .Egg
	
	ld d, a
	ld hl, wPartyMon1Species
.find_target_mon
	ld a, [hl]
	cp d
	jr z, .poison
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	jr .find_target_mon
	
.poison
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData

	ld a, [wBaseType1]
	cp POISON
	jr z, .PoisonImmune
	ld a, [wBaseType2]
	cp POISON
	jr z, .PoisonImmune

	ld bc, MON_STATUS
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .CantInflictPsn
	set PSN, [hl]
	ld hl, PoisonOrParaDone
	call PrintText
	jp .select_mon

.PoisonImmune:
	ld hl, .PoisonImmuneText
	call PrintText
	jp .select_mon

.CantInflictPsn:
	ld hl, CantInflictStatusText
	call PrintText
	jp .select_mon

.Egg:
	ld de, SFX_BUMP
	call WaitPlaySFX

    ld hl, .PoisonEgg
	call PrintText
	jp .select_mon

.PoisonImmuneText:
	text_far _PoisonImmune
	text_end


.PoisonEgg:
	text_far _PoisonEgg
	text_end

.PoisonExit:
	call ReturnToMapWithSpeechTextbox
	call EnableSpriteUpdates
	ret

ParalyzeMon:
	call DisableSpriteUpdates
.select_mon
    farcall SelectTradeOrDayCareMonWithoutReturningToMap
    jp c, .ParalyzeExit
    ld a, [wCurPartySpecies]
    cp EGG
    jp z, .Egg
	
	ld d, a
	ld hl, wPartyMon1Species
.find_target_mon
	ld a, [hl]
	cp d
	jr z, .paralyze
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	jr .find_target_mon
	
.paralyze
	ld bc, MON_STATUS
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .CantInflictPara

	set PAR, [hl]
	ld hl, PoisonOrParaDone
	call PrintText
	jp .select_mon	

.CantInflictPara:
	ld hl, CantInflictStatusText
	call PrintText
	jp .select_mon

.Egg:
	ld de, SFX_BUMP
	call WaitPlaySFX

    ld hl, .ParalyzeEgg
	call PrintText
	jp .select_mon

.ParalyzeEgg:
	text_far _ParalyzeEgg
	text_end
	
.ParalyzeExit:
	call ReturnToMapWithSpeechTextbox
	call EnableSpriteUpdates
	ret

CantInflictStatusText:
	text_far _CantInflictStatus
	text_end

	
NothingToDisplay:
; Does nothing.
	ret

SetPlayerPalette:
	ld a, [wScriptVar]
	ld d, a
	farcall _SetPlayerPalette
	ret

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wNamedObjectIndex], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret

UnusedSetSeenMon:
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	ld hl, wRivalName
	ld de, .DefaultName
	call InitName
	ret

.DefaultName:
	db "SILVER@"

NameRater:
	farcall _NameRater
	ret

OverworldTownMap:
	call FadeToMenu
	farcall _TownMap
	call ExitAllMenus
	ret

UnownPrinter:
	call FadeToMenu
	farcall _UnownPrinter
	call ExitAllMenus
	ret

DisplayLinkRecord:
	call FadeToMenu
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret

CheckMysteryGift:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a

.no
	ld [wScriptVar], a
	call CloseSRAM
	ret

GetMysteryGiftItem:
	ld a, BANK(sMysteryGiftItem)
	call OpenSRAM
	ld a, [sMysteryGiftItem]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret

.ReceiveItemText:
	text_far _ReceiveItemText
	text_end

BugContestJudging:
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret

UnownPuzzle:
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret

UnusedMemoryGame:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_MemoryGame)
	ld hl, _MemoryGame
	call StartGameCornerGame
	ret

StartGameCornerGame:
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret

CheckCoinsAndCoinCase:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret

.NoCoinsText:
	text_far _NoCoinsText
	text_end

.NoCoinCaseText:
	text_far _NoCoinCaseText
	text_end

ClearBGPalettesBufferScreen:
	call ClearBGPalettes
	call BufferScreen
	ret

ScriptReturnCarry:
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret

UnusedCheckUnusedTwoDayTimer:
	farcall CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	ret

StoreSwarmMapIndices::
	ld a, c
	and a
	jr nz, .yanma
; swarm dark cave violet entrance
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
	ret

.yanma
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry

ResetLuckyNumberShowFlag:
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	farcall LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag:
	farcall _CheckLuckyNumberShowFlag
	jp ScriptReturnCarry

SnorlaxAwake:
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, TRUE
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [wScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db -1

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry

GameboyCheck:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	jr nz, .sgb
; gb
	xor a ; GBCHECK_GB
	jr .done

.sgb
	ld a, GBCHECK_SGB
	jr .done

.cgb
	ld a, GBCHECK_CGB
.done
	ld [wScriptVar], a
	ret

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret

Diploma:
	call FadeToMenu
	farcall _Diploma
	call ExitAllMenus
	ret

PrintDiploma:
	call FadeToMenu
	farcall _PrintDiploma
	call ExitAllMenus
	ret

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call OpenSRAM
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM
