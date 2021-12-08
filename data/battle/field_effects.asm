; FieldEffects indexes
	const_def 1
	const AUTOMATIC_SUN
	const AUTOMATIC_RAIN
	const AUTOMATIC_SANDSTORM
    const AUTOMATIC_SPIKES

AutomaticFieldEffectsMaps:
auto_field_effects_map: MACRO
	map_id \1 ; map
	db \2 ; AUTOMATIC_* weather index
ENDM
	auto_field_effects_map ROUTE_29, AUTOMATIC_SPIKES
	db 0 ; end

AutomaticFieldEffects:
; entries correspond to AUTOMATIC_* constants
auto_field_effect: MACRO
	db \1 ; effect
	dw \2 ; animation
	dw \3 ; text
ENDM
	auto_field_effect WEATHER_SUN, SUNNY_DAY, SunGotBrightText
	auto_field_effect WEATHER_RAIN, RAIN_DANCE, DownpourText
	auto_field_effect WEATHER_SANDSTORM, ANIM_IN_SANDSTORM, SandstormBrewedText
    auto_field_effect SCREENS_SPIKES, SPIKES, SpikesText