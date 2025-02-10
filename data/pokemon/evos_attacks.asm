INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, VINE_WHIP
	db 7, POISONPOWDER
	db 10, SLEEP_POWDER
	db 13, RAZOR_LEAF
	db 16, HEADBUTT
	db 19, SLUDGE
	db 23, BODY_SLAM
	db 27, SLUDGE_BOMB
	db 31, SYNTHESIS
	db 36, PETAL_DANCE
	db 41, SYNTHESIS
	db 49, TOXIC
	db 57, ANCIENTPOWER
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, RAZOR_LEAF
	db 1, HEADBUTT
	db 22, SLUDGE
	db 26, BODY_SLAM
	db 32, GIGA_DRAIN
	db 36, SYNTHESIS
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLEEP_POWDER
	db 36, GIGA_DRAIN
	db 41, SLUDGE_BOMB
	db 45, GIGA_DRAIN
	db 49, PETAL_DANCE
	db 55, SYNTHESIS
	db 62, TOXIC
	db 68, ANCIENTPOWER
	db 100, LEECH_SEED
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, EMBER
	db 12, BITE
	db 15, SLASH
	db 18, FIRE_PUNCH
	db 34, DRAGON_RAGE
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, EMBER
	db 17, SCARY_FACE
	db 23, FIRE_PUNCH
	db 28, SLASH
	db 33, DRAGON_RAGE
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 37, WING_ATTACK
	db 42, STEEL_WING
	db 46, FLAMETHROWER
	db 60, FIRE_BLAST
	db 69, EARTHQUAKE
	db 75, METAL_CLAW
	db 79, FLAMETHROWER
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, WATER_GUN
	db 7, BITE
	db 11, SLAM
	db 14, SEISMIC_TOSS
	db 17, BUBBLEBEAM
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 17, BUBBLEBEAM
	db 23, ICE_PUNCH
	db 27, BODY_SLAM
	db 33, WATERFALL
	db 37, ICY_WIND
	db 40, COUNTER
	db 42, RAPID_SPIN
	db 44, EARTHQUAKE
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, BODY_SLAM
	db 1, WATERFALL
	db 36, ICE_BEAM
	db 39, ICY_WIND
	db 44, COUNTER
	db 49, RAPID_SPIN
	db 53, EARTHQUAKE
	db 63, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 7, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 10, CONFUSION
	db 13, MEGA_DRAIN
	db 14, SLEEP_POWDER
	db 16, PSYBEAM
	db 18, GIGA_DRAIN
	db 21, PSYWAVE
	db 23, MORNING_SUN
	db 25, ENCORE
	db 28, ENCORE
	db 28, GIGA_DRAIN
	db 31, PSYCHIC_M
	db 34, STRING_SHOT
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 7, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 7, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 10, TWINEEDLE
	db 12, ACID
	db 15, RAGE
	db 17, SLUDGE
	db 20, GIGA_DRAIN
	db 23, RETURN
	db 25, TWINEEDLE
	db 28, SLUDGE_BOMB
	db 33, TOXIC
	db 37, MEGAHORN
	db 44, HORN_DRILL
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 16, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, GUST
	db 4, SAND_ATTACK
	db 7, QUICK_ATTACK
	db 14, WING_ATTACK
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 18, QUICK_ATTACK
	db 23, SWIFT
	db 28, STEEL_WING
	db 34, RETURN
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 36, STEEL_WING
	db 40, RETURN
	db 45, SKY_ATTACK
	db 55, AEROBLAST
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 13, HYPER_FANG
	db 17, BITE
	db 20, FOCUS_ENERGY
	db 22, SUPER_FANG
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPER_FANG
	db 22, BODY_SLAM
	db 26, CRUNCH
	db 30, SKULL_BASH
	db 34, SHADOW_BALL
	db 38, SCARY_FACE
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 7, PECK
	db 12, MUD_SLAP
	db 15, SWIFT
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 24, WING_ATTACK
	db 29, TRI_ATTACK
	db 34, STEEL_WING
	db 37, DRILL_PECK
	db 43, MIRROR_MOVE
	db 48, AGILITY
	db 53, DOUBLE_EDGE
	db 59, SKY_ATTACK
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, GLARE
	db 4, ACID
	db 9, MEGA_DRAIN
	db 13, WRAP
	db 16, SLAM
	db 19, PURSUIT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACID
	db 22, SLUDGE
	db 25, BITE
	db 30, SLUDGE_BOMB
	db 36, GIGA_DRAIN
	db 41, CRUNCH
	db 47, EARTHQUAKE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 5, THUNDER_WAVE
	db 9, QUICK_ATTACK
	db 13, SPARK
	db 15, SWIFT
	db 19, THUNDERPUNCH
	db 26, SEISMIC_TOSS
	db 32, THUNDERBOLT
	db 36, SURF
	db 36, PETAL_DANCE
	db 36, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_WAVE
	db 42, THUNDERBOLT
	db 48, SEISMIC_TOSS
	db 67, ENCORE
	db 75, THUNDER
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 6, SAND_ATTACK
	db 11, DIG
	db 15, ROCK_THROW
	db 22, SLASH
	db 31, ROCK_SLIDE
	db 37, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 33, ROCK_SLIDE
	db 38, EARTHQUAKE
	db 42, COUNTER
	db 47, ANCIENTPOWER
	db 53, RAPID_SPIN
	db 65, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, MUD_SLAP
	db 8, BITE
	db 13, DOUBLE_KICK
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, BITE
	db 16, HORN_ATTACK
	db 20, SLUDGE
	db 25, BODY_SLAM
	db 33, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLUDGE
	db 40, ATTRACT
	db 50, SLUDGE_BOMB
	db 54, EARTHQUAKE
	db 75, EARTHQUAKE
	db 95, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 4, PECK
	db 8, SCRATCH
	db 13, DOUBLE_KICK
	db 16, HORN_ATTACK
	db 20, SLUDGE
	db 23, BITE
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 16, HORN_ATTACK
	db 20, SLUDGE
	db 23, BITE
	db 27, BODY_SLAM
	db 36, SLUDGE_BOMB
	db 48, THRASH
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLUDGE
	db 36, BODY_SLAM
	db 50, SLUDGE_BOMB
	db 54, EARTHQUAKE
	db 59, THRASH
	db 75, EARTHQUAKE
	db 95, EARTHQUAKE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 4, SING
	db 8, METRONOME
	db 12, ATTRACT
	db 15, SWIFT
	db 19, SEISMIC_TOSS
	db 23, HEADBUTT
	db 27, ENCORE
	db 32, LIGHT_SCREEN
	db 36, TRI_ATTACK
	db 41, MOONLIGHT
	db 56, DOUBLE_EDGE
	db 62, LOVELY_KISS
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 23, ATTRACT
	db 36, BODY_SLAM
	db 49, MOONLIGHT
	db 56, DOUBLE_EDGE
	db 62, LOVELY_KISS
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 7, SWIFT
	db 13, FLAME_WHEEL
	db 16, BITE
	db 17, CONFUSE_RAY
	db 30, FLAMETHROWER
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 36, HYPNOSIS
	db 39, IRON_TAIL
	db 46, FLAMETHROWER
	db 49, FAINT_ATTACK
	db 51, CONFUSE_RAY
	db 67, SOLARBEAM
	db 72, SACRED_FIRE
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, DEFENSE_CURL
	db 4, DIZZY_PUNCH
	db 9, BUBBLEBEAM
	db 12, ROLLOUT
	db 14, FAINT_ATTACK
	db 17, HEADBUTT
	db 21, SEISMIC_TOSS
	db 26, THUNDER_WAVE
	db 29, BODY_SLAM
	db 32, DOUBLE_EDGE
	db 37, HYPER_BEAM
	db 45, EXPLOSION
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIZZY_PUNCH
	db 29, THUNDER_WAVE
	db 33, BODY_SLAM
	db 35, DOUBLE_EDGE
	db 39, HYPER_BEAM
	db 45, EXPLOSION
	db 49, THUNDER_WAVE
	db 53, BODY_SLAM
	db 57, DOUBLE_EDGE
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 4, BITE
	db 7, MEGA_DRAIN
	db 9, CONFUSE_RAY
	db 12, WING_ATTACK
	db 15, SLUDGE
	db 28, SLUDGE_BOMB
	db 34, GIGA_DRAIN
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_LEVEL, 45, CROBAT
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 22, WING_ATTACK
	db 28, SLUDGE_BOMB
	db 34, GIGA_DRAIN
	db 41, MEAN_LOOK
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 16, GLOOM
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 4, ACID
	db 9, POISONPOWDER
	db 13, MOONLIGHT
	db 16, RAZOR_LEAF
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 13, MOONLIGHT
	db 24, SLEEP_POWDER
	db 30, GIGA_DRAIN
	db 35, SLUDGE_BOMB
	db 40, SLEEP_POWDER
	db 46, MOONLIGHT
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 47, SLUDGE_BOMB
	db 55, MOONLIGHT
	db 64, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 4, STUN_SPORE
	db 7, MEGA_DRAIN
	db 10, TOXIC
	db 14, BODY_SLAM
	db 18, GIGA_DRAIN
	db 22, FURY_CUTTER
	db 25, SPORE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 14, BODY_SLAM
	db 18, GIGA_DRAIN
	db 25, SPORE
	db 28, LEECH_LIFE
	db 30, TOXIC
	db 33, SYNTHESIS
	db 36, GIGA_DRAIN
	db 39, SPORE
	db 42, SLUDGE_BOMB
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 29, VENOMOTH
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 6, MEGA_DRAIN
	db 11, PSYBEAM
	db 15, SLUDGE
	db 18, NIGHT_SHADE
	db 21, TOXIC
	db 24, PROTECT
	db 27, SLUDGE_BOMB
	db 30, MORNING_SUN
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, TOXIC
	db 1, PROTECT
	db 1, SLUDGE_BOMB
	db 34, MORNING_SUN
	db 37, PSYCHIC_M
	db 50, SLUDGE_BOMB
	db 60, TOXIC
	db 60, PROTECT
	db 60, SLUDGE_BOMB
	db 60, MORNING_SUN
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 5, SCRATCH
	db 9, MAGNITUDE
	db 16, ROCK_THROW
	db 23, DIG
	db 38, ROCK_SLIDE
	db 44, SLUDGE_BOMB
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, MAGNITUDE
	db 26, SLASH
	db 30, ROCK_SLIDE
	db 38, TRI_ATTACK
	db 44, SLUDGE_BOMB
	db 50, EARTHQUAKE
	db 85, ANCIENTPOWER
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 25, PERSIAN
	db 0 ; no more evolutions
	db 1, PAY_DAY
	db 7, BITE
	db 10, SLASH
	db 13, BUBBLEBEAM
	db 16, BODY_SLAM
	db 19, ICY_WIND
	db 22, THUNDERBOLT
	db 25, RETURN
	db 28, SHADOW_BALL
	db 31, METAL_CLAW
	db 37, DOUBLE_EDGE
	db 41, SCREECH
	db 44, HYPER_BEAM
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, RETURN
	db 28, SHADOW_BALL
	db 31, METAL_CLAW
	db 37, DOUBLE_EDGE
	db 41, SCREECH
	db 44, HYPER_BEAM
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 30, GOLDUCK
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 4, WATER_GUN
	db 7, HYPNOSIS
	db 13, HEADBUTT
	db 17, BUBBLEBEAM
	db 21, ICE_PUNCH
	db 26, SEISMIC_TOSS
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 33, HYPNOSIS
	db 37, WATERFALL
	db 42, ICE_BEAM
	db 46, PSYCHIC_M
	db 51, DISABLE
	db 56, HYDRO_PUMP
	db 61, ENCORE
	db 66, CROSS_CHOP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 5, ROCK_THROW
	db 9, SEISMIC_TOSS
	db 15, KARATE_CHOP
	db 23, BODY_SLAM
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 31, SUBMISSION
	db 35, ROCK_SLIDE
	db 42, THRASH
	db 46, FORESIGHT
	db 50, ENCORE
	db 55, CROSS_CHOP
	db 98, REVERSAL
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, EMBER
	db 6, HEADBUTT
	db 11, BITE
	db 16, TAKE_DOWN
	db 24, FLAME_WHEEL
	db 36, FLAMETHROWER
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 39, CRUNCH
	db 45, FLAMETHROWER
	db 53, IRON_TAIL
	db 59, EXTREMESPEED
	db 68, MORNING_SUN
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 4, HYPNOSIS
	db 10, BODY_SLAM
	db 16, BUBBLEBEAM
	db 20, AURORA_BEAM
	db 31, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_LEVEL, 36, POLITOED
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 25, BODY_SLAM
	db 31, VITAL_THROW
	db 37, ICE_PUNCH
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 40, SUBMISSION
	db 45, ICE_BEAM
	db 50, HYDRO_PUMP
	db 65, CROSS_CHOP
	db 76, LOVELY_KISS
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 7, KINESIS
	db 30, RECOVER
	db 90, PSYCHIC_M
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 55, ALAKAZAM
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 22, PSYBEAM
	db 25, THUNDER_WAVE
	db 28, SEISMIC_TOSS
	db 30, RECOVER
	db 37, PSYCHIC_M
	db 90, PSYCHIC_M
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, SEISMIC_TOSS
	db 45, RECOVER
	db 55, PSYCHIC_M
	db 85, DISABLE
	db 90, PSYCHIC_M
	db 100, ENCORE
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 8, DIZZY_PUNCH
	db 13, SEISMIC_TOSS
	db 16, ROCK_THROW
	db 23, VITAL_THROW
	db 60, CROSS_CHOP
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 55, MACHAMP
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 30, SUBMISSION
	db 39, ROCK_SLIDE
	db 61, FORESIGHT
	db 65, CROSS_CHOP
	db 70, COUNTER
	db 80, EARTHQUAKE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, CROSS_CHOP
	db 1, ROCK_SLIDE
	db 67, FORESIGHT
	db 74, CROSS_CHOP
	db 78, COUNTER
	db 80, ROCK_SLIDE
	db 91, EARTHQUAKE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 16, WEEPINBELL
	db 0 ; no more evolutions
	db 1, ACID
	db 8, RAZOR_LEAF
	db 14, STUN_SPORE
	db 17, TOXIC
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, ACID
	db 26, GIGA_DRAIN
	db 33, BODY_SLAM
	db 36, SLUDGE_BOMB
	db 44, LOVELY_KISS
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOVELY_KISS
	db 1, STUN_SPORE
	db 1, GIGA_DRAIN
	db 42, SLUDGE_BOMB
	db 47, PETAL_DANCE
	db 54, SYNTHESIS
	db 63, LOVELY_KISS
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 40, TENTACRUEL
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, ACID
	db 12, WRAP
	db 16, BUBBLEBEAM
	db 21, AURORA_BEAM
	db 45, RAPID_SPIN
	db 56, SLUDGE_BOMB
	db 80, WATERFALL
	db 99, TOXIC
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, ATTRACT
	db 1, ICE_BEAM
	db 1, SURF
	db 50, SLUDGE_BOMB
	db 55, ICE_BEAM
	db 73, WATERFALL
	db 99, TOXIC
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 7, MUD_SLAP
	db 14, MAGNITUDE
	db 26, SELFDESTRUCT
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 42, GOLEM
	db 0 ; no more evolutions
	db 1, SELFDESTRUCT
	db 25, BODY_SLAM
	db 31, ROCK_SLIDE
	db 55, EARTHQUAKE
	db 60, ANCIENTPOWER
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, EARTHQUAKE
	db 1, ROCK_SLIDE
	db 1, BODY_SLAM
	db 56, EARTHQUAKE
	db 60, ANCIENTPOWER
	db 99, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 31, RAPIDASH
	db 0 ; no more evolutions
	db 1, EMBER
	db 9, STOMP
	db 17, DOUBLE_KICK
	db 24, FLAME_WHEEL
	db 30, JUMP_KICK
	db 37, FLAMETHROWER
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 20, JUMP_KICK
	db 34, DOUBLE_EDGE
	db 42, FLAMETHROWER
	db 46, IRON_TAIL
	db 52, MEGAHORN
	db 57, HI_JUMP_KICK
	db 64, FIRE_BLAST
	db 70, HYPNOSIS
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, WATER_STONE, SLOWKING
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 8, WATER_GUN
	db 14, HEADBUTT
	db 23, BUBBLEBEAM
	db 28, PSYBEAM
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, PSYBEAM
	db 58, PSYCHIC_M
	db 63, DISABLE
	db 68, PSYCH_UP
	db 73, WATERFALL
	db 85, PSYCHIC_M
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 6, THUNDER_WAVE
	db 13, THUNDERSHOCK
	db 21, TRI_ATTACK
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 26, ENDURE
	db 30, THUNDER_WAVE
	db 37, SPARK
	db 44, HIDDEN_POWER
	db 52, THUNDERBOLT
	db 60, LOCK_ON
	db 60, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 5, GUST
	db 9, QUICK_ATTACK
	db 13, FALSE_SWIPE
	db 18, SLASH
	db 23, WING_ATTACK
	db 27, STEEL_WING
	db 34, SUBMISSION
	db 38, SKY_ATTACK
	db 43, DOUBLE_EDGE
	db 55, AEROBLAST
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 37, DODRIO
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 5, PECK
	db 14, SWIFT
	db 18, DOUBLE_KICK
	db 25, WING_ATTACK
	db 34, TRI_ATTACK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 45, DRILL_PECK
	db 49, STEEL_WING
	db 54, JUMP_KICK
	db 67, DOUBLE_EDGE
	db 75, SKY_ATTACK
	db 95, HI_JUMP_KICK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 13, HEADBUTT
	db 17, AURORA_BEAM
	db 23, BUBBLEBEAM
	db 29, SAFEGUARD
	db 34, ICY_WIND
	db 39, WATERFALL
	db 45, ICE_BEAM
	db 53, ENCORE
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 35, DISABLE
	db 39, BODY_SLAM
	db 42, WATERFALL
	db 46, ICE_BEAM
	db 56, ICY_WIND
	db 76, ENCORE
	db 100, REST
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 37, MUK
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 7, ACID
	db 13, SLUDGE
	db 18, DISABLE
	db 23, BODY_SLAM
	db 25, SLUDGE_BOMB
	db 37, SHADOW_BALL
	db 46, FLAMETHROWER
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLUDGE_BOMB
	db 39, GIGA_DRAIN
	db 44, FLAMETHROWER
	db 48, SLUDGE_BOMB
	db 53, SHADOW_BALL
	db 99, EXPLOSION
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 9, CLAMP
	db 14, AURORA_BEAM
	db 18, SPIKE_CANNON
	db 23, BUBBLEBEAM
	db 35, WATERFALL
	db 50, ICE_BEAM
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, CLAMP
	db 35, TRI_ATTACK
	db 43, TWINEEDLE
	db 50, ICE_BEAM
	db 55, RAPID_SPIN
	db 73, SPIKES
	db 99, EXPLOSION
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, CONFUSE_RAY
	db 1, NIGHT_SHADE
	db 1, LICK
	db 99, HYPNOSIS
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 55, GENGAR
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 33, FAINT_ATTACK
	db 46, SHADOW_BALL
	db 68, PSYCHIC_M
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 46, SHADOW_BALL
	db 52, SUBMISSION
	db 76, PSYCHIC_M
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_LEVEL, 55, STEELIX
	db 0 ; no more evolutions
	db 1, WRAP
	db 5, RAGE
	db 9, MAGNITUDE
	db 14, ROCK_THROW
	db 20, SLAM
	db 27, ROCK_SLIDE
	db 34, BIDE
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 9, CONFUSION
	db 15, SEISMIC_TOSS
	db 21, HEADBUTT
	db 26, PSYBEAM
	db 31, SHADOW_BALL
	db 37, SUBMISSION
	db 42, THUNDER_WAVE
	db 46, PSYCHIC_M
	db 50, DISABLE
	db 65, REFLECT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 31, SHADOW_BALL
	db 35, SUBMISSION
	db 38, THUNDER_WAVE
	db 42, PSYCHIC_M
	db 47, DISABLE
	db 54, REFLECT
	db 60, MEDITATE
	db 60, SUBMISSION
	db 60, SHADOW_BALL
	db 65, PSYCHIC_M
	db 70, HYPNOSIS
	db 80, MEDITATE
	db 80, SUBMISSION
	db 80, SHADOW_BALL
	db 85, PSYCHIC_M
	db 90, HYPNOSIS
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 9, STOMP
	db 14, BUBBLEBEAM
	db 26, DIG
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, STOMP
	db 29, WATERFALL
	db 31, SUBMISSION
	db 36, BODY_SLAM
	db 40, CRABHAMMER
	db 44, METAL_CLAW
	db 65, CRABHAMMER
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, SONICBOOM
	db 1, THUNDER_WAVE
	db 1, SPARK
	db 24, SELFDESTRUCT
	db 34, THUNDERBOLT
	db 46, LIGHT_SCREEN
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPARK
	db 34, THUNDERBOLT
	db 40, REFLECT
	db 40, LIGHT_SCREEN
	db 50, SCREECH
	db 77, EXPLOSION
	db 80, THUNDER
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 13, MEGA_DRAIN
	db 17, STUN_SPORE
	db 24, PSYBEAM
	db 30, EGG_BOMB
	db 36, RAZOR_LEAF
	db 46, SLEEP_POWDER
	db 57, PSYCHIC_M
	db 67, GIGA_DRAIN
	db 99, ANCIENTPOWER
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 36, EGG_BOMB
	db 45, GIGA_DRAIN
	db 57, PSYCHIC_M
	db 67, GIGA_DRAIN
	db 99, ANCIENTPOWER
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 24, MAROWAK
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 13, BONE_CLUB
	db 15, ROCK_THROW
	db 23, BONE_RUSH
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, BONE_CLUB
	db 26, ROCK_SLIDE
	db 31, BONEMERANG
	db 34, FRUSTRATION
	db 38, EARTHQUAKE
	db 46, ANCIENTPOWER
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 26, DOUBLE_KICK
	db 30, BODY_SLAM
	db 36, SUBMISSION
	db 42, RAPID_SPIN
	db 48, SEISMIC_TOSS
	db 56, EARTHQUAKE
	db 62, ROCK_SLIDE
	db 69, HI_JUMP_KICK
	db 95, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 26, MACH_PUNCH
	db 33, SUBMISSION
	db 39, RAPID_SPIN
	db 46, ROCK_SLIDE
	db 54, EARTHQUAKE
	db 58, COUNTER
	db 67, CROSS_CHOP
	db 90, MEDITATE
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 7, ROLLOUT
	db 13, POUND
	db 17, STOMP
	db 21, DISABLE
	db 25, BODY_SLAM
	db 29, ICE_BEAM
	db 32, FLAMETHROWER
	db 36, RETURN
	db 40, EARTHQUAKE
	db 70, REST
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 31, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 4, SMOG
	db 8, SMOKESCREEN
	db 13, PSYWAVE
	db 18, SLUDGE
	db 24, PSYBEAM
	db 30, SCREECH
	db 36, THUNDERBOLT
	db 40, SLUDGE_BOMB
	db 44, FLAMETHROWER
	db 50, SELFDESTRUCT
	db 85, EXPLOSION
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYWAVE
	db 1, SLUDGE
	db 1, PSYBEAM
	db 1, SCREECH
	db 36, THUNDERBOLT
	db 40, SLUDGE_BOMB
	db 44, FLAMETHROWER
	db 64, PAIN_SPLIT
	db 68, SLUDGE_BOMB
	db 70, EXPLOSION
	db 85, EXPLOSION
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 13, ROCK_THROW
	db 18, MAGNITUDE
	db 27, BODY_SLAM
	db 34, ROCK_SLIDE
	db 42, EARTHQUAKE
	db 47, DOUBLE_EDGE
	db 56, MEGAHORN
	db 74, ANCIENTPOWER
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 42, EARTHQUAKE
	db 47, DOUBLE_EDGE
	db 56, MEGAHORN
	db 74, ANCIENTPOWER
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_LEVEL, 90, BLISSEY
	db 0 ; no more evolutions
	db 1, EGG_BOMB
	db 14, THUNDER_WAVE
	db 40, CHARM
	db 100, HEAL_BELL
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, WRAP
	db 7, FAINT_ATTACK
	db 10, VINE_WHIP
	db 17, MEGA_DRAIN
	db 24, STUN_SPORE
	db 28, HIDDEN_POWER
	db 34, RAZOR_LEAF
	db 38, BODY_SLAM
	db 43, FAINT_ATTACK
	db 47, PETAL_DANCE
	db 55, ANCIENTPOWER
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 28, BODY_SLAM
	db 34, SUBMISSION
	db 39, COUNTER
	db 45, EARTHQUAKE
	db 50, RETURN
	db 58, CROSS_CHOP
	db 65, DOUBLE_EDGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, POUND
	db 7, WATER_GUN
	db 14, AURORA_BEAM
	db 23, BUBBLEBEAM
	db 27, DRAGONBREATH
	db 32, WATERFALL
	db 37, DRAGON_RAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_LEVEL, 50, KINGDRA
	db 0 ; no more evolutions
	db 1, WATERFALL
	db 35, DRAGON_RAGE
	db 40, DRAGONBREATH
	db 47, ICE_BEAM
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 25, SEAKING
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, HORN_ATTACK
	db 13, PSYBEAM
	db 17, BUBBLEBEAM
	db 25, ICE_BEAM
	db 30, WATERFALL
	db 34, MEGAHORN
	db 38, HAZE
	db 41, HYDRO_PUMP
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 25, ICE_BEAM
	db 28, WATERFALL
	db 32, MEGAHORN
	db 36, HAZE
	db 40, HYDRO_PUMP
	db 44, DOUBLE_EDGE
	db 50, LOCK_ON
	db 50, HORN_DRILL
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, CONFUSE_RAY
	db 14, TRI_ATTACK
	db 23, BUBBLEBEAM
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 49, ICE_BEAM
	db 55, PSYCHIC_M
	db 60, RAPID_SPIN
	db 67, THUNDERBOLT
	db 73, WATERFALL
	db 99, RECOVER
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 6, HYPNOSIS
	db 16, SEISMIC_TOSS
	db 24, PSYBEAM
	db 35, THUNDERBOLT
	db 45, PSYCHIC_M
	db 49, BARRIER
	db 54, REFLECT
	db 60, ENCORE
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_LEVEL, 55, SCIZOR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, FALSE_SWIPE
	db 14, QUICK_ATTACK
	db 24, SLASH
	db 31, WING_ATTACK
	db 37, STEEL_WING
	db 45, RAZOR_WIND
	db 53, FURY_CUTTER
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICY_WIND
	db 18, ICE_PUNCH
	db 30, PSYBEAM
	db 35, SEISMIC_TOSS
	db 44, ICE_BEAM
	db 54, PSYCHIC_M
	db 60, LOVELY_KISS
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERPUNCH
	db 42, THUNDERBOLT
	db 53, CROSS_CHOP
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, FIRE_PUNCH
	db 31, CONFUSE_RAY
	db 37, CROSS_CHOP
	db 42, FLAMETHROWER
	db 48, THUNDERBOLT
	db 62, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 13, FURY_CUTTER
	db 24, BODY_SLAM
	db 29, SUBMISSION
	db 34, ROCK_SLIDE
	db 40, MEGAHORN
	db 45, EARTHQUAKE
	db 50, CROSS_CHOP
	db 60, GUILLOTINE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 12, QUICK_ATTACK
	db 16, SCARY_FACE
	db 20, RAGE
	db 24, DOUBLE_KICK
	db 34, BODY_SLAM
	db 40, QUICK_ATTACK
	db 55, ROCK_SLIDE
	db 67, EARTHQUAKE
	db 80, IRON_TAIL
	db 90, DOUBLE_EDGE
	db 95, QUICK_ATTACK
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 30, GYARADOS
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, FLAIL
	db 1, TACKLE
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAGON_RAGE
	db 35, WATERFALL
	db 38, THUNDERBOLT
	db 42, ICE_BEAM
	db 45, DOUBLE_EDGE
	db 51, HYDRO_PUMP
	db 59, EARTHQUAKE
	db 64, ICE_BEAM
	db 68, DOUBLE_EDGE
	db 72, HYDRO_PUMP
	db 75, EARTHQUAKE
	db 80, RAGE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 14, CONFUSE_RAY
	db 22, AURORA_BEAM
	db 30, SLAM
	db 67, ICE_BEAM
	db 73, THUNDERBOLT
	db 99, PERISH_SONG
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_ITEM, SUN_STONE, ESPEON
	db EVOLVE_ITEM, MOON_STONE, UMBREON
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 7, SAND_ATTACK
	db 15, HEADBUTT
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 15, WATER_GUN
	db 23, BUBBLEBEAM
	db 28, AURORA_BEAM
	db 34, WATERFALL
	db 43, ICE_BEAM
	db 46, HAZE
	db 52, ATTRACT
	db 64, RECOVER
	db 73, GROWTH
	db 100, BATON_PASS
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 15, THUNDERSHOCK
	db 19, BITE
	db 24, SPARK
	db 29, BITE
	db 37, THUNDER_WAVE
	db 44, THUNDERBOLT
	db 52, HIDDEN_POWER
	db 99, SING
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 15, EMBER
	db 23, DOUBLE_KICK
	db 28, FLAMETHROWER
	db 33, CURSE
	db 37, SHADOW_BALL
	db 46, DOUBLE_EDGE
	db 53, IRON_TAIL
	db 59, SACRED_FIRE
	db 72, EXTREMESPEED
	db 84, BATON_PASS
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_LEVEL, 40, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION
	db 1, CONVERSION
	db 1, RECOVER
	db 1, TRI_ATTACK
	db 12, PSYBEAM
	db 20, RECOVER
	db 25, ICY_WIND
	db 30, SHADOW_BALL
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 8, AURORA_BEAM
	db 16, ROCK_SLIDE
	db 20, BUBBLEBEAM
	db 29, SURF
	db 36, ICE_BEAM
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 42, WATERFALL
	db 49, ANCIENTPOWER
	db 55, HYDRO_PUMP
	db 70, RECOVER
	db 85, SPIKES
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 7, BUBBLEBEAM
	db 14, SLASH
	db 19, SUBMISSION
	db 24, ROCK_SLIDE
	db 33, HYDRO_PUMP
	db 39, DOUBLE_EDGE
	db 66, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 46, EARTHQUAKE
	db 66, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, WING_ATTACK
	db 45, ROCK_SLIDE
	db 78, FIRE_BLAST
	db 85, CRUNCH
	db 100, SCARY_FACE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXPLOSION
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, SKY_ATTACK
	db 1, REST
	db 1, SLEEP_TALK
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERBOLT
	db 1, DRILL_PECK
	db 1, HIDDEN_POWER
	db 1, THUNDER_WAVE
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, MORNING_SUN
	db 1, SKY_ATTACK
	db 1, FIRE_BLAST
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, DRAGON_RAGE
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, DRAGON_RAGE
	db 30, THUNDER_WAVE
	db 36, BUBBLEBEAM
	db 39, WRAP
	db 42, BODY_SLAM
	db 47, AURORA_BEAM
	db 51, SAFEGUARD
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAGON_RAGE
	db 55, WING_ATTACK
	db 59, THUNDERBOLT
	db 60, ICE_BEAM
	db 65, FLAMETHROWER
	db 74, EXTREMESPEED
	db 87, DOUBLE_EDGE
	db 99, OUTRAGE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCH_UP
	db 1, RECOVER
	db 1, PSYCHIC_M
	db 1, SUBMISSION
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCH_UP
	db 1, SUBMISSION
	db 1, SHADOW_BALL
	db 1, SOFTBOILED
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, RAZOR_LEAF
	db 12, POISONPOWDER
	db 16, SYNTHESIS
	db 24, LIGHT_SCREEN
	db 29, GIGA_DRAIN
	db 43, SAFEGUARD
	db 58, PETAL_DANCE
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, RAZOR_LEAF
	db 1, SYNTHESIS
	db 19, HEADBUTT
	db 26, BODY_SLAM
	db 31, GIGA_DRAIN
	db 39, LIGHT_SCREEN
	db 47, SAFEGUARD
	db 58, PETAL_DANCE
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, SYNTHESIS
	db 41, LIGHT_SCREEN
	db 49, REFLECT
	db 58, PETAL_DANCE
	db 77, EARTHQUAKE
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, EMBER
	db 12, HEADBUTT
	db 14, FLAME_WHEEL
	db 19, SMOKESCREEN
	db 24, FURY_SWIPES
	db 33, IRON_TAIL
	db 54, FLAMETHROWER
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 14, FLAME_WHEEL
	db 17, QUICK_ATTACK
	db 21, SMOKESCREEN
	db 24, FIRE_PUNCH
	db 31, FLAMETHROWER
	db 36, IRON_TAIL
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAME_WHEEL
	db 37, SUBMISSION
	db 43, FLAMETHROWER
	db 50, EARTHQUAKE
	db 57, FIRE_BLAST
	db 64, CROSS_CHOP
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 16, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, WATER_GUN
	db 12, SWIFT
	db 15, RAGE
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SLASH
	db 18, CRUNCH
	db 21, HEADBUTT
	db 23, BUBBLEBEAM
	db 32, SUBMISSION
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, ICE_PUNCH
	db 31, SUBMISSION
	db 36, WATERFALL
	db 44, DOUBLE_EDGE
	db 53, EARTHQUAKE
	db 58, ICE_BEAM
	db 65, CROSS_CHOP
	db 85, ANCIENTPOWER
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 5, SWIFT
	db 8, ROCK_SMASH
	db 13, PURSUIT
	db 16, HEADBUTT
	db 20, GROWL
	db 24, BODY_SLAM
	db 28, DOUBLE_EDGE
	db 32, IRON_TAIL
	db 36, SHADOW_BALL
	db 42, EXTREMESPEED
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 16, HEADBUTT
	db 20, GROWL
	db 24, BODY_SLAM
	db 28, DOUBLE_EDGE
	db 32, IRON_TAIL
	db 36, SHADOW_BALL
	db 42, EXTREMESPEED
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HYPNOSIS
	db 1, GUST
	db 8, NIGHT_SHADE
	db 16, WING_ATTACK
	db 20, PSYBEAM
	db 27, WHIRLWIND
	db 30, REFLECT
	db 33, SHADOW_BALL
	db 37, PSYCHIC_M
	db 42, DREAM_EATER
	db 51, RETURN
	db 57, SKY_ATTACK
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 20, PSYBEAM
	db 27, WHIRLWIND
	db 30, REFLECT
	db 33, PSYCHIC_M
	db 37, SHADOW_BALL
	db 42, DREAM_EATER
	db 51, RETURN
	db 57, SKY_ATTACK
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 16, LEDIAN
	db 0 ; no more evolutions
	db 1, FURY_CUTTER
	db 6, MACH_PUNCH
	db 11, PSYBEAM
	db 15, GIGA_DRAIN
	db 19, REFLECT
	db 21, LIGHT_SCREEN
	db 23, TOXIC
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 17, THUNDERPUNCH
	db 21, ICE_PUNCH
	db 22, PSYCHIC_M
	db 25, REFLECT
	db 28, LIGHT_SCREEN
	db 45, ENCORE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, SLUDGE
	db 7, MEGA_DRAIN
	db 13, NIGHT_SHADE
	db 16, TOXIC
	db 19, DISABLE
	db 22, STRING_SHOT
	db 23, TOXIC
	db 23, GIGA_DRAIN
	db 25, PSYCHIC_M
	db 27, LEECH_LIFE
	db 31, SLUDGE_BOMB
	db 36, SHADOW_BALL
	db 46, MEGAHORN
	db 57, AGILITY
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 23, TOXIC
	db 23, GIGA_DRAIN
	db 25, PSYCHIC_M
	db 27, LEECH_LIFE
	db 33, SHADOW_BALL
	db 37, SLUDGE_BOMB
	db 43, MEGAHORN
	db 50, AGILITY
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 1, GIGA_DRAIN
	db 1, SLUDGE_BOMB
	db 39, WING_ATTACK
	db 48, SHADOW_BALL
	db 55, SLUDGE_BOMB
	db 61, SCREECH
	db 80, HYPNOSIS
	db 99, SKY_ATTACK
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, THUNDERSHOCK
	db 9, CONFUSE_RAY
	db 14, THUNDER_WAVE
	db 18, SPARK
	db 24, AURORA_BEAM
	db 26, BUBBLEBEAM
	db 37, THUNDERBOLT
	db 44, HYDRO_PUMP
	db 50, ICE_BEAM
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 1, THUNDER_WAVE
	db 1, BUBBLEBEAM
	db 1, SPARK
	db 37, THUNDERBOLT
	db 44, HYDRO_PUMP
	db 50, ICE_BEAM
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_LEVEL, 15, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, PRESENT
	db 6, THUNDER_WAVE
	db 8, SWEET_KISS
	db 13, SPARK
	db 25, THUNDERBOLT
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_LEVEL, 15, CLEFAIRY
	db 0 ; no more evolutions
	db 1, PRESENT
	db 1, METRONOME
	db 1, SWEET_KISS
	db 8, DIZZY_PUNCH
	db 25, SING
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_LEVEL, 15, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, PRESENT
	db 1, SWEET_KISS
	db 1, FAINT_ATTACK
	db 4, DEFENSE_CURL
	db 9, SING
	db 14, DIZZY_PUNCH
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_LEVEL, 18, TOGETIC
	db 0 ; no more evolutions
	db 1, PRESENT
	db 4, METRONOME
	db 7, SEISMIC_TOSS
	db 18, DOUBLE_EDGE
	db 20, SOFTBOILED
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, SOFTBOILED
	db 18, THUNDER_WAVE
	db 21, PSYCHIC_M
	db 24, SOFTBOILED
	db 30, ENCORE
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 4, CONFUSE_RAY
	db 7, PECK
	db 13, NIGHT_SHADE
	db 16, WING_ATTACK
	db 30, PSYCHIC_M
	db 34, GIGA_DRAIN
	db 37, PSYCHIC_M
	db 45, SKY_ATTACK
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 25, PSYBEAM
	db 29, DRILL_PECK
	db 34, GIGA_DRAIN
	db 37, PSYCHIC_M
	db 42, DRILL_PECK
	db 47, SKY_ATTACK
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 5, SWIFT
	db 9, THUNDER_WAVE
	db 16, SAFEGUARD
	db 30, LIGHT_SCREEN
	db 45, THUNDERBOLT
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, SWIFT
	db 1, THUNDER_WAVE
	db 17, SPARK
	db 24, SAFEGUARD
	db 30, FIRE_PUNCH
	db 45, THUNDERBOLT
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_WAVE
	db 1, SPARK
	db 30, FIRE_PUNCH
	db 44, THUNDERBOLT
	db 70, THUNDERBOLT
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, STUN_SPORE
	db 1, DOUBLE_EDGE
	db 1, GIGA_DRAIN
	db 35, SLEEP_POWDER
	db 45, PETAL_DANCE
	db 60, MOONLIGHT
	db 62, SLEEP_POWDER
	db 65, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, ICE_BEAM
	db 6, CHARM
	db 10, SEISMIC_TOSS
	db 13, ROLLOUT
	db 16, HEADBUTT
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, SEISMIC_TOSS
	db 1, ROLLOUT
	db 1, HEADBUTT
	db 19, ATTRACT
	db 23, WATERFALL
	db 25, SUBMISSION
	db 28, BODY_SLAM
	db 37, LOVELY_KISS
	db 50, PERISH_SONG
	db 55, BELLY_DRUM
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 10, LOW_KICK
	db 14, SLAM
	db 18, ROLLOUT
	db 25, ROCK_SLIDE
	db 28, SUBMISSION
	db 31, EARTHQUAKE
	db 37, HI_JUMP_KICK
	db 44, ANCIENTPOWER
	db 87, EXPLOSION
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 36, WATERFALL
	db 40, ICE_BEAM
	db 44, ENCORE
	db 48, CROSS_CHOP
	db 52, LOVELY_KISS
	db 56, HYDRO_PUMP
	db 62, EARTHQUAKE
	db 73, PERISH_SONG
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 16, SKIPLOOM
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 4, CONFUSION
	db 9, TOXIC
	db 11, STUN_SPORE
	db 14, RAZOR_LEAF
	db 16, SLEEP_POWDER
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 25, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SLEEP_POWDER
	db 10, TOXIC
	db 15, STUN_SPORE
	db 22, GIGA_DRAIN
	db 25, FLY
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, DOUBLE_EDGE
	db 1, SLEEP_POWDER
	db 1, TOXIC
	db 25, FLY
	db 36, PETAL_DANCE
	db 43, SKY_ATTACK
	db 50, SYNTHESIS
	db 64, LEECH_SEED
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_SWIPES
	db 7, PURSUIT
	db 14, GROWL
	db 19, QUICK_ATTACK
	db 23, SWIFT
	db 31, SUBMISSION
	db 36, BODY_SLAM
	db 47, IRON_TAIL
	db 57, SHADOW_BALL
	db 66, DOUBLE_EDGE
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_LEVEL, 16, SUNFLORA
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 4, POISONPOWDER
	db 9, HIDDEN_POWER
	db 13, RAZOR_LEAF
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 16, SYNTHESIS
	db 19, RETURN
	db 23, GIGA_DRAIN
	db 28, LEECH_SEED
	db 31, PETAL_DANCE
	db 38, GROWTH
	db 42, SACRED_FIRE
	db 46, SUNNY_DAY
	db 50, SPORE
	db 53, LEECH_SEED
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 6, HYPNOSIS
	db 10, LEECH_LIFE
	db 15, GIGA_DRAIN
	db 18, WING_ATTACK
	db 24, TOXIC
	db 28, HIDDEN_POWER
	db 32, SHADOW_BALL
	db 38, PROTECT
	db 45, SKY_ATTACK
	db 52, ANCIENTPOWER
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 7, MAGNITUDE
	db 14, ROCK_THROW
	db 23, BODY_SLAM
	db 29, EARTHQUAKE
	db 32, ICE_BEAM
	db 35, HYDRO_PUMP
	db 40, WATERFALL
	db 43, SLUDGE_BOMB
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 25, BODY_SLAM
	db 30, WATERFALL
	db 35, EARTHQUAKE
	db 39, ICE_BEAM
	db 43, SLUDGE_BOMB
	db 47, HYDRO_PUMP
	db 60, RECOVER
	db 70, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, PSYWAVE
	db 20, PSYBEAM
	db 27, BITE
	db 33, SHADOW_BALL
	db 39, CRUNCH
	db 44, PSYCHIC_M
	db 52, MORNING_SUN
	db 59, ENCORE
	db 100, GROWTH
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 20, BODY_SLAM
	db 35, BITE
	db 39, CONFUSE_RAY
	db 44, CRUNCH
	db 55, SHADOW_BALL
	db 78, MEAN_LOOK
	db 85, MOONLIGHT
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 7, NIGHT_SHADE
	db 12, PURSUIT
	db 18, FAINT_ATTACK
	db 24, WING_ATTACK
	db 28, HAZE
	db 33, DRILL_PECK
	db 37, SHADOW_BALL
	db 44, SKY_ATTACK
	db 52, CRUNCH
	db 60, PERISH_SONG
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCHIC_M
	db 45, WATERFALL
	db 51, ICE_BEAM
	db 55, PSYCHIC_M
	db 61, FLAMETHROWER
	db 68, EARTHQUAKE
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 16, FAINT_ATTACK
	db 24, PSYBEAM
	db 29, HYPNOSIS
	db 34, THUNDERBOLT
	db 44, SHADOW_BALL
	db 49, PSYWAVE
	db 55, PSYCHIC_M
	db 73, PAIN_SPLIT
	db 85, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, DESTINY_BOND
	db 40, ENCORE
	db 100, SAFEGUARD
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, CONFUSION
	db 9, BITE
	db 12, CONFUSE_RAY
	db 16, STOMP
	db 19, PSYBEAM
	db 23, CRUNCH
	db 27, BODY_SLAM
	db 31, LIGHT_SCREEN
	db 31, REFLECT
	db 35, PSYCHIC_M
	db 39, EARTHQUAKE
	db 43, THUNDERBOLT
	db 48, RETURN
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, PIN_MISSILE
	db 9, TACKLE
	db 14, HEADBUTT
	db 28, SELFDESTRUCT
	db 32, DOUBLE_EDGE
	db 38, LIGHT_SCREEN
	db 43, ROCK_SLIDE
	db 54, EARTHQUAKE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, PIN_MISSILE
	db 29, SELFDESTRUCT
	db 35, DOUBLE_EDGE
	db 41, LIGHT_SCREEN
	db 42, ROCK_SLIDE
	db 57, EARTHQUAKE
	db 67, RAPID_SPIN
	db 99, EXPLOSION
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 4, DEFENSE_CURL
	db 7, HAZE
	db 12, ROLLOUT
	db 15, HEADBUTT
	db 18, RAGE
	db 21, GLARE
	db 24, ROCK_SLIDE
	db 27, BODY_SLAM
	db 31, EARTHQUAKE
	db 35, SHADOW_BALL
	db 41, ANCIENTPOWER
	db 45, DOUBLE_EDGE
	db 48, RAPID_SPIN
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 9, SCRATCH
	db 17, MUD_SLAP
	db 26, QUICK_ATTACK
	db 34, SLASH
	db 39, STEEL_WING
	db 46, DIG
	db 53, SCREECH
	db 62, WING_ATTACK
	db 72, ROCK_SLIDE
	db 80, EARTHQUAKE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWAGGER
	db 1, BODY_SLAM
	db 1, ROCK_SLIDE
	db 56, IRON_TAIL
	db 67, EARTHQUAKE
	db 75, BIDE
	db 99, EXPLOSION
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, METRONOME
	db 6, HAZE
	db 10, LICK
	db 14, HEADBUTT
	db 18, CRUNCH
	db 25, BODY_SLAM
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, METRONOME
	db 1, BITE
	db 1, SWIFT
	db 1, BODY_SLAM
	db 23, ATTRACT
	db 27, CRUNCH
	db 31, BODY_SLAM
	db 37, SHADOW_BALL
	db 42, SUBMISSION
	db 46, EARTHQUAKE
	db 50, RETURN
	db 57, SCARY_FACE
	db 80, LOVELY_KISS
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, ACID
	db 12, TWINEEDLE
	db 16, HEADBUTT
	db 20, BUBBLEBEAM
	db 25, SLUDGE
	db 30, WATERFALL
	db 34, SLUDGE_BOMB
	db 40, TOXIC
	db 47, EXPLOSION
	db 73, SPIKES
	db 90, DESTINY_BOND
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 45, LIGHT_SCREEN
	db 50, DOUBLE_EDGE
	db 55, WING_ATTACK
	db 60, FURY_CUTTER
	db 65, SUBMISSION
	db 70, STEEL_WING
	db 85, SUBMISSION
	db 90, METAL_CLAW
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SANDSTORM
	db 1, WRAP
	db 1, STRING_SHOT
	db 1, BIDE
	db 30, DISABLE
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 13, HORN_ATTACK
	db 18, ROCK_SMASH
	db 24, FURY_CUTTER
	db 31, WING_ATTACK
	db 37, COUNTER
	db 44, COUNTER
	db 51, VITAL_THROW
	db 57, ROCK_SLIDE
	db 68, SUBMISSION
	db 74, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_SWIPES
	db 13, FAINT_ATTACK
	db 22, ICE_PUNCH
	db 30, BEAT_UP
	db 38, SHADOW_BALL
	db 46, ICE_BEAM
	db 55, METAL_CLAW
	db 64, SCREECH
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 9, LICK
	db 15, SEISMIC_TOSS
	db 21, SLASH
	db 27, KARATE_CHOP
	db 35, METAL_CLAW
	db 39, BODY_SLAM
	db 44, EARTHQUAKE
	db 47, SUBMISSION
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, SEISMIC_TOSS
	db 35, METAL_CLAW
	db 39, BODY_SLAM
	db 44, EARTHQUAKE
	db 47, SUBMISSION
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, ROCK_THROW
	db 14, FLAME_WHEEL
	db 20, ROCK_SLIDE
	db 27, FLAMETHROWER
	db 30, RECOVER
	db 45, FIRE_BLAST
	db 49, RAPID_SPIN
	db 57, EARTHQUAKE
	db 64, ANCIENTPOWER
	db 72, EXPLOSION
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 21, ROCK_SLIDE
	db 31, FLAMETHROWER
	db 37, RECOVER
	db 45, FIRE_BLAST
	db 49, RAPID_SPIN
	db 57, EARTHQUAKE
	db 64, ANCIENTPOWER
	db 72, AMNESIA
	db 85, EXPLOSION
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 50, PILOSWINE
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 7, MUD_SLAP
	db 14, MAGNITUDE
	db 28, ICY_WIND
	db 37, RETURN
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, MAGNITUDE
	db 1, ICY_WIND
	db 1, RETURN
	db 52, ROCK_SLIDE
	db 58, ICE_BEAM
	db 66, EARTHQUAKE
	db 99, ANCIENTPOWER
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 6, CONFUSE_RAY
	db 18, AURORA_BEAM
	db 22, ROCK_SLIDE
	db 26, RECOVER
	db 30, WATERFALL
	db 33, ICE_BEAM
	db 37, MIRROR_COAT
	db 42, ANCIENTPOWER
	db 53, RAPID_SPIN
	db 58, ANCIENTPOWER
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 7, PSYBEAM
	db 13, AURORA_BEAM
	db 17, BUBBLEBEAM
	db 25, FLAMETHROWER
	db 37, ICE_BEAM
	db 55, HYPER_BEAM
	db 60, OCTAZOOKA
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 1, BUBBLEBEAM
	db 32, OCTAZOOKA
	db 37, OCTAZOOKA
	db 38, ICE_BEAM
	db 54, RETURN
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 6, POWDER_SNOW
	db 10, PECK
	db 13, FURY_SWIPES
	db 18, AURORA_BEAM
	db 21, SAFEGUARD
	db 25, WING_ATTACK
	db 31, ICE_BEAM
	db 39, SKY_ATTACK
	db 44, DESTINY_BOND
	db 48, RAPID_SPIN
	db 57, SPIKES
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, AURORA_BEAM
	db 6, CONFUSE_RAY
	db 13, BUBBLEBEAM
	db 20, TOXIC
	db 25, WING_ATTACK
	db 31, ICE_BEAM
	db 37, WATERFALL
	db 49, CONFUSE_RAY
	db 72, AEROBLAST
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 10, SWAGGER
	db 17, MUD_SLAP
	db 25, WING_ATTACK
	db 34, ROCK_SLIDE
	db 48, DRILL_PECK
	db 62, STEEL_WING
	db 100, WHIRLWIND
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 30, HOUNDOOM
	db 0 ; no more evolutions
	db 1, SMOG
	db 7, EMBER
	db 13, PURSUIT
	db 17, BITE
	db 25, FLAME_WHEEL
	db 29, ROAR
	db 33, QUICK_ATTACK
	db 37, FLAMETHROWER
	db 48, CRUNCH
	db 67, FIRE_BLAST
	db 99, RETURN
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAME_WHEEL
	db 1, BITE
	db 43, FLAMETHROWER
	db 53, CRUNCH
	db 67, FIRE_BLAST
	db 99, RETURN
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATERFALL
	db 50, DRAGONBREATH
	db 55, ICE_BEAM
	db 65, OCTAZOOKA
	db 73, DOUBLE_EDGE
	db 80, OCTAZOOKA
	db 90, OCTAZOOKA
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, FLAIL
	db 7, ROCK_THROW
	db 11, HEADBUTT
	db 16, ROLLOUT
	db 17, MAGNITUDE
	db 25, DOUBLE_EDGE
	db 33, ROCK_SLIDE
	db 44, RAPID_SPIN
	db 53, EARTHQUAKE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, MAGNITUDE
	db 1, ROCK_THROW
	db 1, ROLLOUT
	db 27, SWAGGER
	db 31, BODY_SLAM
	db 37, ROCK_SLIDE
	db 44, EARTHQUAKE
	db 53, RAPID_SPIN
	db 68, DOUBLE_EDGE
	db 72, ANCIENTPOWER
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 35, THUNDER_WAVE
	db 40, THUNDERBOLT
	db 46, ICE_BEAM
	db 54, TRI_ATTACK
	db 60, RECOVER
	db 66, CONVERSION
	db 70, CONVERSION2
	db 75, HYPER_BEAM
	db 80, TRI_ATTACK
	db 85, RECOVER
	db 90, SHARPEN
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 7, TACKLE
	db 10, TAKE_DOWN
	db 16, HEADBUTT
	db 20, REFLECT
	db 27, JUMP_KICK
	db 35, EARTHQUAKE
	db 40, RETURN
	db 45, HI_JUMP_KICK
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 25, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 25, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 25, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, KARATE_CHOP
	db 25, DOUBLE_KICK
	db 31, DETECT
	db 37, SUBMISSION
	db 45, RAPID_SPIN
	db 53, ROCK_SLIDE
	db 58, EARTHQUAKE
	db 66, COUNTER
	db 74, HI_JUMP_KICK
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 7, CONFUSION
	db 14, SWEET_KISS
	db 19, ICY_WIND
	db 25, PSYBEAM
	db 30, ICE_PUNCH
	db 49, ICE_BEAM
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 7, QUICK_ATTACK
	db 14, KARATE_CHOP
	db 19, DIZZY_PUNCH
	db 23, THUNDER_WAVE
	db 26, THUNDERPUNCH
	db 37, THUNDERBOLT
	db 43, CROSS_CHOP
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, MACH_PUNCH
	db 13, DIZZY_PUNCH
	db 16, CONFUSE_RAY
	db 19, FIRE_PUNCH
	db 26, CONFUSE_RAY
	db 36, FLAMETHROWER
	db 42, CROSS_CHOP
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSE_RAY
	db 7, ATTRACT
	db 15, HEADBUTT
	db 30, BODY_SLAM
	db 37, SHADOW_BALL
	db 42, EARTHQUAKE
	db 46, MILK_DRINK
	db 48, HEAL_BELL
	db 53, IRON_TAIL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_WAVE
	db 4, REFLECT
	db 7, PSYWAVE
	db 9, SAFEGUARD
	db 13, LIGHT_SCREEN
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SURF
	db 1, ICE_BEAM
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 7, ROCK_THROW
	db 15, MAGNITUDE
	db 24, THRASH
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 65, TYRANITAR
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 47, BITE
	db 54, SCARY_FACE
	db 65, HYPER_BEAM
	db 80, CRUNCH
	db 90, ROCK_SLIDE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, HYPER_BEAM
	db 1, SCARY_FACE
	db 80, CRUNCH
	db 90, ROCK_SLIDE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 22, RECOVER
	db 99, AEROBLAST
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, WHIRLWIND
	db 1, ROAR
	db 22, RECOVER
	db 99, SACRED_FIRE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, PSYCH_UP
	db 1, RECOVER
	db 1, PSYCHIC_M
	db 0 ; no more level-up moves
