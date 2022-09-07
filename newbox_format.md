# Newbox data format

## Save file address locations

* 0x2d10-0x2f20: Gameplay newbox metadata (0x210 bytes)
* 0x2f20-0x3130: Saved newbox metadata (0x210 bytes)

Total boxes: 16 gameplay boxes, 16 saved boxes.
Extraction from a .sav should be done from 0x2f20 unless save was interrupted.
If saving was interrupted, box data *might* be in 0x2d10-0x2f20 instead,
depending on when in the process you interrupted the saving.

* 0x4000-0x5ff2: Pokémon database 1 (0x1ff2 bytes)
* 0x6000-0x7ff2: Pokémon database 2 (0x1ff2 bytes)

Total database entries: 174 per database, 348 total.
Pokémon data referenced by newbox metadata. Left unitialized on a new game,
there is no gurantee that data in here that isn't referenced by boxes above
isn't filled with garbage. Hence, always reference data here indirectly by
reading the newbox metadata.

## Newbox metadata format

Each individual "newbox" box is 0x21, or 33 bytes, long. It contains the
following data:

0x00-0x13: Database pointers for the species
0x14-0x16: Bitflags for which of the 2 databases the given entry uses
0x17-0x1F: Box name (9 characters in GSC character format, no string terminator)
0x20: Box theme

The pointers contains either 0, for a blank slot, or 1-174, corresponding to
a database entry. Each entry has a corresponding bitflag, which is unset if
database bank 1 is referenced, set if database bank 2 is. The entry referenced
can be somewhat arbitrary (each time a player adds a Pokémon to the storage,
the game looks up the lowest entry not marked as used, and thus over time the
pointer list can become somewhat haphazardly ordered). Thus, the pointers
should not be relied on to be in any particular order. This is a major reason
as to why you shouldn't try to reference pokedb Pokémon directly.
For blank slots, the bitflag has no impact (and may be set if the slot used to
reference a Pokémon from storage database 2) and should be ignored.

Box name is stored as 9 characters with no terminator using the standard GSC
character map. Box theme can be anything between 0-29 for a valid theme.
The theme order is as follows:

* Standard
* Pro
* Mobile
* Classic
* Bliss
* Contrast
* Nature
* Truth
* Ideals
* Light
* Darkness
* Matte
* Normal
* Fighting
* Flying
* Poison
* Ground
* Rock
* Bug
* Ghost
* Steel
* Fire
* Water
* Grass
* Electric
* Psychic
* Ice
* Dragon
* Dark
* Fairy

## Pokémon database format

Each individual pokedb entry is 0x2F, or 47 bytes, long. It contains the
following data:

0x00: Species
0x01: Item
0x02-0x05: Moves
0x06-0x07: OT ID
0x08-0x0A: Experience
0x0B-0x14: Stat experience (HP, Attack, Defense, Speed, Special)
0x15-0x16: DVs
0x17: PP Up data
0x18: Friendship/Egg cycles
0x19: Pokérus data
0x1A: Caught time and level
0x1B: OT gender and caught location
0x1C: Level
0x1D: "Alt" species
0x1E-0x27: Nickname excluding terminator
0x28-0x2E: OT name excluding terminator (only 7 bytes are stored)
0x1E-0x2E also contains the checksum.

Data in 0x00-0x16 is identical to a regular GSC Pokémon.

0x17 stores PP Up data as 0bDDCCBBAA where A is move 1, B is move 2,
C is move 3 and D is move 4.

Data in 0x18-0x1C is also identical to GSC, but shifted because instead of
storing 4 bytes for PP, newbox only stores a single byte for PP Up data.

0x1D contains "Alt" species. A quick explanation: GSC stores 2 species bytes,
which are usually identical. The main exception is Eggs, which stores Egg
as one of the 2 species bytes. For the purpose of newbox, "Alt" species contains
the species byte that is set to Egg when applicable.

0x1E-0x27 and 0x28-0x2E contains nickname and OT name respectively. They do not
include the terminator. These are for the most part GSC character data without
the 7th bit being part of the name. When interpreting the name here,
set the most significant bit, and do the following conversions:

* Treat 0xC0 as a space (0x7F)
* Treat 0xC1 as a terminator (0x50)
* Treat 0xC2 as a zero (0x00)

The most significant bit in 0x1E-0x27 (nickname) and 0x28-0x2E (OT name) stores
a checksum. If this checksum is invalid, the game will decode the Pokémon into
a Bad Egg. This is NOT done as some sort of anticheat (despite what many people
believe about the purpose of Bad Eggs). The reason this is done is to act as a
failsafe against data corruption. If invalid Pokémon data were to be interpreted
by the game (a corrupted save file or similar), and said data would crash the
game with SRAM banks still open, there is a large chance that the save will be
irreparably broken. Bad Eggs is a failsafe against this, since the game isn't
going to crash by trying to interpret its data.
