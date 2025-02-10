time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old, .Shore_Good, .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old, .Ocean_Good, .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old, .Lake_Good, .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old, .Pond_Good, .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old, .Dratini_Good, .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old, .Qwilfish_Swarm_Good, .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old, .Remoraid_Swarm_Good, .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old, .Gyarados_Good, .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old, .Dratini_2_Good, .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old, .WhirlIslands_Good, .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old, .Qwilfish_Good, .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old, .Remoraid_Good, .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  70 percent + 1, KRABBY, 14
	db  85 percent + 1, CORSOLA, 14
	db 100 percent, time_group 0
.Shore_Good:
	db  35 percent, KINGLER, 38
	db  70 percent, SEAKING, 38
	db  90 percent + 1, MANTINE, 38
	db 100 percent, time_group 1
.Shore_Super:
	db  40 percent, QWILFISH, 65
	db  70 percent, time_group 2
	db  90 percent + 1, OCTILLERY, 65
	db 100 percent, GOLDUCK, 65

.Ocean_Old:
	db  70 percent + 1, TENTACOOL, 14
	db  85 percent + 1, CHINCHOU, 14
	db 100 percent, STARYU, 14
.Ocean_Good:
	db  35 percent, CORSOLA, 38
	db  70 percent, CHINCHOU, 38
	db  90 percent + 1, TENTACOOL, 38
	db 100 percent, time_group 3
.Ocean_Super:
	db  40 percent, MANTINE, 65
	db  70 percent, time_group 4
	db  90 percent + 1, TENTACRUEL, 65
	db 100 percent, STARYU, 65

.Lake_Old:
	db  70 percent + 1, KABUTO, 14
	db  85 percent + 1, OMANYTE, 14
	db 100 percent, SLOWPOKE, 14
.Lake_Good:
	db  35 percent, SEADRA, 38
	db  70 percent, SLOWBRO, 38
	db  90 percent + 1, HORSEA, 38
	db 100 percent, STARYU, 38
.Lake_Super:
	db  40 percent, SLOWBRO, 65
	db  70 percent, time_group 5
	db  90 percent + 1, KABUTOPS, 65
	db 100 percent, SEAKING, 65

.Pond_Old:
	db  70 percent + 1, REMORAID, 14
	db  85 percent + 1, REMORAID, 14
	db 100 percent, SEEL, 14
.Pond_Good:
	db  35 percent, POLIWHIRL, 38
	db  70 percent, SLOWPOKE, 38
	db  90 percent + 1, POLIWHIRL, 38
	db 100 percent, time_group 6
.Pond_Super:
	db  40 percent, POLIWHIRL, 65
	db  70 percent, time_group 7
	db  90 percent + 1, AZUMARILL, 65
	db 100 percent, QUAGSIRE, 65

.Dratini_Old:
	db  70 percent + 1, DRATINI, 5
	db  85 percent + 1, SEADRA, 5
	db 100 percent, DRAGONAIR, 5
.Dratini_Good:
	db  35 percent, DRAGONAIR, 63
	db  70 percent, DRAGONAIR, 63
	db  90 percent + 1, SEADRA, 63
	db 100 percent, time_group 8
.Dratini_Super:
	db  40 percent, KINGDRA, 65
	db  70 percent, time_group 9
	db  90 percent + 1, KINGDRA, 65
	db 100 percent, DRAGONITE, 65

.Qwilfish_Swarm_Old:
	db  70 percent + 1, time_group 10
	db  85 percent + 1, QWILFISH, 5
	db 100 percent, time_group 11
.Qwilfish_Swarm_Good:
	db  35 percent, MAGIKARP, 20
	db  70 percent, QWILFISH, 20
	db  90 percent + 1, QWILFISH, 20
	db 100 percent, QWILFISH, 20
.Qwilfish_Swarm_Super:
	db  40 percent, QWILFISH, 40
	db  70 percent, QWILFISH, 40
	db  90 percent + 1, QWILFISH, 40
	db 100 percent, QWILFISH, 40

.Remoraid_Swarm_Old:
	db  70 percent + 1, MAGIKARP, 10
	db  85 percent + 1, MAGIKARP, 10
	db 100 percent, REMORAID, 10
.Remoraid_Swarm_Good:
	db  35 percent, MAGIKARP, 20
	db  70 percent, REMORAID, 20
	db  90 percent + 1, REMORAID, 20
	db 100 percent, REMORAID, 20
.Remoraid_Swarm_Super:
	db  40 percent, REMORAID, 40
	db  70 percent, REMORAID, 40
	db  90 percent + 1, REMORAID, 40
	db 100 percent, REMORAID, 40

.Gyarados_Old:
	db  70 percent + 1, GYARADOS, 5
	db  85 percent + 1, GYARADOS, 15
	db 100 percent, MAGIKARP, 25
.Gyarados_Good:
	db  35 percent, GYARADOS, 38
	db  70 percent, GYARADOS, 38
	db  90 percent + 1, MAGIKARP, 38
	db 100 percent, GYARADOS, 38
.Gyarados_Super:
	db  40 percent, MAGIKARP, 65
	db  70 percent, MAGIKARP, 65
	db  90 percent + 1, MAGIKARP, 65
	db 100 percent, MAGIKARP, 65

.Dratini_2_Old:
	db  70 percent + 1, POLIWHIRL, 60
	db  85 percent + 1, POLITOED, 60
	db 100 percent, DEWGONG, 60
.Dratini_2_Good:
	db  35 percent, OMASTAR, 62
	db  70 percent, LANTURN, 62
	db  90 percent + 1, QUAGSIRE, 62
	db 100 percent, time_group 12
.Dratini_2_Super:
	db  40 percent, DRAGONAIR, 65
	db  70 percent, DRAGONAIR, 65
	db  90 percent + 1, DRAGONAIR, 65
	db 100 percent, DRAGONAIR, 65

.WhirlIslands_Old:
	db  70 percent + 1, DEWGONG, 50
	db  85 percent + 1, SEADRA, 50
	db 100 percent, SEADRA, 50
.WhirlIslands_Good:
	db  35 percent, SEADRA, 50
	db  70 percent, DEWGONG, 50
	db  90 percent + 1, SEADRA, 50
	db 100 percent, time_group 13
.WhirlIslands_Super:
	db  40 percent, SEADRA, 65
	db  70 percent, CLOYSTER, 65
	db  90 percent + 1, SLOWBRO, 65
	db 100 percent, KINGDRA, 65

.Qwilfish_Old:
	db  70 percent + 1, TENTACOOL, 14
	db  85 percent + 1, CHINCHOU, 14
	db 100 percent, STARYU, 14
.Qwilfish_Good:
	db  35 percent, POLIWHIRL, 38
	db  70 percent, SLOWPOKE, 38
	db  90 percent + 1, TENTACOOL, 38
	db 100 percent, time_group 14
.Qwilfish_Super:
	db  40 percent, STARYU, 65
	db  70 percent, time_group 15
	db  90 percent + 1, LANTURN, 65
	db 100 percent, MANTINE, 65

.Remoraid_Old:
	db  70 percent + 1, MAGIKARP, 14
	db  85 percent + 1, MAGIKARP, 14
	db 100 percent, POLIWAG, 14
.Remoraid_Good:
	db  35 percent, MAGIKARP, 38
	db  70 percent, POLIWAG, 38
	db  90 percent + 1, POLIWAG, 38
	db 100 percent, POLIWAG, 38
.Remoraid_Super:
	db  40 percent, POLIWHIRL, 65
	db  70 percent, POLIWHIRL, 65
	db  90 percent + 1, GYARADOS, 65
	db 100 percent, REMORAID, 65

.Qwilfish_NoSwarm_Old:
	db  70 percent + 1, TENTACOOL, 14
	db  85 percent + 1, CHINCHOU, 14
	db 100 percent, STARYU, 14
.Qwilfish_NoSwarm_Good:
	db  35 percent, POLIWHIRL, 38
	db  70 percent, SLOWPOKE, 38
	db  90 percent + 1, TENTACOOL, 38
	db 100 percent, time_group 14
.Qwilfish_NoSwarm_Super:
	db  40 percent, STARYU, 65
	db  70 percent, time_group 15
	db  90 percent + 1, LANTURN, 65
	db 100 percent, MANTINE, 65

TimeFishGroups:
	;  day              nite
	db SEEL, 14, HORSEA, 14 ; (0)
	db CORSOLA, 38, STARYU, 38 ; (1)
	db CORSOLA, 65, STARYU, 65 ; (2)
	db CORSOLA, 38, SHELLDER, 38 ; (3)
	db STARYU, 65, SHELLDER, 65 ; (4)
	db QUAGSIRE, 65, QWILFISH, 65 ; (5)
	db WOOPER, 38, SLOWPOKE, 38 ; (6)
	db POLITOED, 65, POLIWRATH, 65 ; (7)
	db DRAGONAIR, 63, SEADRA, 63 ; (8)
	db KINGDRA, 65, DRAGONITE, 65 ; (9)
	db QWILFISH, 5, MAGIKARP, 5 ; (10)
	db REMORAID, 5, QWILFISH, 5 ; (11)
	db QUAGSIRE, 62, SHELLDER, 62 ; (12)
	db HORSEA, 50, SHELLDER, 50 ; (13)
	db CHINCHOU, 38, WOOPER, 38 ; (14)
	db TENTACRUEL, 65, QWILFISH, 65 ; (15)
