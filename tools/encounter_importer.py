#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 encounter_importer.py -E="Mastersheet - Encounters.csv" -S="Mastersheet - Special Encounters.csv" -O

Rips the contents of a provided csv containing encounter data and produces code.
-E is the main encounter file if provided, and -S is the special encounter tables file
If -O is provided, output files to current folder instead of correct locations
"""

import csv
import re
import sys

from pokemon_data import *

def main():
	main_path = 'Mastersheet - Encounters.csv'
	special_path = 'Mastersheet - Special Encounters.csv'
	output_to_local = False
	for arg in sys.argv[1:]:
		if arg.startswith('-E='):
			main_path = arg[3:].strip('"')
		elif arg.startswith('-S='):
			special_path = arg[3:].strip('"')
		elif arg == '-O':
			output_to_local = True

	with open(main_path) as f:
		reader = csv.reader(f)
		data = []
		for row in reader:
			data.append(row)

	routes = {}
	for i in range(1, len(data[0]), 2):
		route_name = data[1][i+1]
		routes[route_name] = {}

		routes[route_name]['chances'] = (data[2][i+1].strip('%'), data[10][i+1].strip('%'), data[18][i+1].strip('%'), data[26][i+1].strip('%'))
		day = []
		night = []
		morning = []
		surf = []
		if routes[route_name]['chances'][0]:
			for j in range(7):
				day.append((data[3+j][i], convert_data_name(data[3+j][i+1])))
				night.append((data[11+j][i], convert_data_name(data[11+j][i+1])))
				morning.append((data[19+j][i], convert_data_name(data[19+j][i+1])))

		if routes[route_name]['chances'][3]:
			for j in range(3):
				surf.append((data[27+j][i], convert_data_name(data[27+j][i+1])))

		routes[route_name]['day'] = day
		routes[route_name]['night'] = night
		routes[route_name]['morning'] = morning
		routes[route_name]['surf'] = surf
		routes[route_name]['fishing'] = data[30][i+1]
		routes[route_name]['headbutt'] = data[61][i+1]
		routes[route_name]['rock'] = data[76][i+1]

		if not routes[route_name]['fishing']:
			routes[route_name]['fishing'] = 'None'

	with open(special_path) as f:
		reader = csv.reader(f)
		data = []
		for row in reader:
			data.append(row)

	fishing_tables = {}
	fishing_time_groups = []
	headbutt_tables = {}
	rocksmash_tables = {}
	for i in range(1, len(data[0]), 2):
		fish_name = data[1][i+1]
		if fish_name:
			day = []
			night = []
			for j in range(3):
				day.append((data[4+j][i], convert_data_name(data[4+j][i+1])))
			for j in range(4):
				day.append((data[8+j][i], convert_data_name(data[8+j][i+1])))
			for j in range(4):
				day.append((data[13+j][i], convert_data_name(data[13+j][i+1])))
			for j in range(3):
				night.append((data[19+j][i], convert_data_name(data[19+j][i+1])))
			for j in range(4):
				night.append((data[23+j][i], convert_data_name(data[23+j][i+1])))
			for j in range(4):
				night.append((data[28+j][i], convert_data_name(data[28+j][i+1])))
			if day != night:
				for j in range(11):
					if day[j] != night[j]:
						group = (day[j][0], day[j][1], night[j][0], night[j][1])
						if group in fishing_time_groups:
							day[j] = f'time_group {fishing_time_groups.index(group)}'
						else:
							day[j] = f'time_group {len(fishing_time_groups)}'
							fishing_time_groups.append(group)
			fishing_tables[fish_name] = day

		headbutt_name = data[32][i+1]
		if headbutt_name:
			table = []
			for j in range(6):
				table.append((data[34+j][i], convert_data_name(data[34+j][i+1])))
			for j in range(6):
				table.append((data[42+j][i], convert_data_name(data[32+j][i+1])))
			headbutt_tables[headbutt_name] = table

		rocksmash_name = data[47][i+1]
		if rocksmash_name:
			table = []
			for j in range(2):
				table.append((data[48+j][i], convert_data_name(data[48+j][i+1])))
			rocksmash_tables[rocksmash_name] = table

	# Grass
	maps = []
	for route in JOHTO_ROUTES:
		if route not in routes:
			print(f'Unknown route: {route}')
			continue
		if not routes[route]['chances'][0]:
			continue
		lines = []
		lines.append(f'\tdef_grass_wildmons {route}')
		lines.append(f'\tdb {routes[route]["chances"][2]} percent, {routes[route]["chances"][0]} percent, {routes[route]["chances"][1]} percent ; encounter rates: morn/day/nite')
		lines.append(f'\t; morn')
		for e in routes[route]['morning']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append(f'\t; day')
		for e in routes[route]['day']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append(f'\t; nite')
		for e in routes[route]['night']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append('\tend_grass_wildmons')
		maps.append('\n'.join(lines))
	out = '; Johto Pokémon in grass\n\nJohtoGrassWildMons:\n\n' + '\n\n'.join(maps) + '\n\n\tdb -1; end\n'
	path = 'johto_grass.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	maps = []
	for route in KANTO_ROUTES:
		if route not in routes:
			print(f'Unknown route: {route}')
			continue
		if not routes[route]['chances'][0]:
			continue
		lines = []
		lines.append(f'\tdef_grass_wildmons {route}')
		lines.append(f'\tdb {routes[route]["chances"][2]} percent, {routes[route]["chances"][0]} percent, {routes[route]["chances"][1]} percent ; encounter rates: morn/day/nite')
		lines.append(f'\t; morn')
		for e in routes[route]['morning']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append(f'\t; day')
		for e in routes[route]['day']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append(f'\t; nite')
		for e in routes[route]['night']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append('\tend_grass_wildmons')
		maps.append('\n'.join(lines))
	out = '; Kanto Pokémon in grass\n\nKantoGrassWildMons:\n\n' + '\n\n'.join(maps) + '\n\n\tdb -1; end\n'
	path = 'kanto_grass.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	# Surf
	maps = []
	for route in JOHTO_ROUTES:
		if route not in routes:
			print(f'Unknown route: {route}')
			continue
		if not routes[route]['chances'][3]:
			continue
		lines = []
		lines.append(f'\tdef_water_wildmons {route}')
		lines.append(f'\tdb {routes[route]["chances"][3]} percent ; encounter rate')
		for e in routes[route]['surf']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append('\tend_water_wildmons')
		maps.append('\n'.join(lines))
	out = '; Johto Pokémon in water\n\nJohtoWaterWildMons:\n\n' + '\n\n'.join(maps) + '\n\n\tdb -1; end\n'
	path = 'johto_water.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	maps = []
	for route in KANTO_ROUTES:
		if route not in routes:
			print(f'Unknown route: {route}')
			continue
		if not routes[route]['chances'][3]:
			continue
		lines = []
		lines.append(f'\tdef_water_wildmons {route}')
		lines.append(f'\tdb {routes[route]["chances"][3]} percent ; encounter rate')
		for e in routes[route]['surf']:
			lines.append(f'\tdb {e[0]}, {e[1]}')
		lines.append('\tend_water_wildmons')
		maps.append('\n'.join(lines))
	out = '; Kanto Pokémon in water\n\nKantoWaterWildMons:\n\n' + '\n\n'.join(maps) + '\n\n\tdb -1; end\n'
	path = 'kanto_water.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	# Headbutt/Rock
	names = [*headbutt_tables.keys(), *rocksmash_tables.keys()]
	out = 'TreeMons:\n; entries correspond to TREEMON_SET_* constants\n\ttable_width 2, TreeMons\n'
	out += '\n'.join(f'	dw TreeMonSet_{name}' for name in names)
	out += '\n\tassert_table_length NUM_TREEMON_SETS\n\n; Two tables each (common, rare).\n; Structure:\n;	db  %, species, level'
	headbutt_chances = ['50','15','10','10',' 5',' 5']
	rock_chances = ['90','10']
	for table in headbutt_tables:
		out += f'\n\nTreeMonSet_{table}:\n; common\n'
		for i in range(6):
			out += f'\tdb {headbutt_chances[i]}, {headbutt_tables[table][i][1]}, {headbutt_tables[table][i][0]}\n'
		out += '\tdb -1\n; rare\n'
		for i in range(6):
			out += f'\tdb {headbutt_chances[i]}, {headbutt_tables[table][i][1]}, {headbutt_tables[table][i][0]}\n'
		out += '\tdb -1'
	for table in rocksmash_tables:
		out += f'\n\nTreeMonSet_{table}:\n'
		for i in range(2):
			out += f'\tdb {rock_chances[i]}, {rocksmash_tables[table][i][1]}, {rocksmash_tables[table][i][0]}\n'
		out += '\tdb -1'
	out += '\n'
	path = 'treemons.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	with open('../constants/pokemon_data_constants.asm') as f:
		data = f.read()
	out = '; treemon sets\n; TreeMons indexes (see data/wild/treemons.asm)\n\tconst_def\n'
	out += '\n'.join(f'\tconst TREEMON_SET_{convert_data_name(name)}' for name in names)
	out += '\nNUM_TREEMON_SETS EQU const_value'
	data = re.sub(r'; treemon sets[\s\S]*NUM_TREEMON_SETS EQU const_value', out, data)
	path = 'pokemon_data_constants.asm'
	if not output_to_local:
		path = '../constants/' + path
	with open(path, 'w') as f:
		f.write(data)

	out = 'treemon_map: MACRO\n	map_id \\1\n	db \\2 ; treemon set\nENDM\n\nTreeMonMaps:\n'
	for route in routes:
		if routes[route]['headbutt']:
			out += f'\ttreemon_map {route}, TREEMON_SET_{convert_data_name(routes[route]["headbutt"])}\n'
	out += '\tdb -1\n\nRockMonMaps:\n'
	for route in routes:
		if routes[route]['rock']:
			out += f'\ttreemon_map {route}, TREEMON_SET_{convert_data_name(routes[route]["rock"])}\n'
	out += '\tdb -1\n'
	path = 'treemon_maps.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	# Fish
	out = 'time_group EQUS "0," ; use the nth TimeFishGroups entry\n\nfishgroup: MACRO\n;'
	out += ' chance, old rod, good rod, super rod\n\tdb \\1\n\tdw \\2, \\3, \\4\nENDM\n\n'
	out += 'FishGroups:\n; entries correspond to FISHGROUP_* constants\n\ttable_width FISHGROUP_DATA_LENGTH, FishGroups'
	for name in fishing_tables:
		out += f'\n\tfishgroup 50 percent + 1, .{name}_Old, .{name}_Good, .{name}_Super'
	out += '\n	assert_table_length NUM_FISHGROUPS'
	chances = ((' 70 percent + 1', ' 85 percent + 1', '100 percent'),
		(' 35 percent', ' 70 percent', ' 90 percent + 1', '100 percent'),
		(' 40 percent', ' 70 percent', ' 90 percent + 1', '100 percent'))
	for name in fishing_tables:
		out += f'\n\n.{name}_Old:'
		for i in range(3):
			if isinstance(fishing_tables[name][i], str):
				out += f'\n\tdb {chances[0][i]}, {fishing_tables[name][i]}'
			else:
				out += f'\n\tdb {chances[0][i]}, {fishing_tables[name][i][1]}, {fishing_tables[name][i][0]}'
		out += f'\n.{name}_Good:'
		for i in range(3,7):
			if isinstance(fishing_tables[name][i], str):
				out += f'\n\tdb {chances[1][i-3]}, {fishing_tables[name][i]}'
			else:
				out += f'\n\tdb {chances[1][i-3]}, {fishing_tables[name][i][1]}, {fishing_tables[name][i][0]}'
		out += f'\n.{name}_Super:'
		for i in range(7,11):
			if isinstance(fishing_tables[name][i], str):
				out += f'\n\tdb {chances[2][i-7]}, {fishing_tables[name][i]}'
			else:
				out += f'\n\tdb {chances[2][i-7]}, {fishing_tables[name][i][1]}, {fishing_tables[name][i][0]}'
	out += '\n\nTimeFishGroups:\n\t;  day              nite'
	for i, group in enumerate(fishing_time_groups):
		out += f'\n\tdb {group[1]}, {group[0]}, {group[3]}, {group[2]} ; ({i})'
	out += '\n'
	path = 'fish.asm'
	if not output_to_local:
		path = '../data/wild/' + path
	with open(path, 'w') as f:
		f.write(out)

	with open('../constants/map_data_constants.asm') as f:
		data = f.read()
	out = '; FishGroups indexes (see data/wild/fish.asm)\n\tconst_def\n\tconst FISHGROUP_NONE\n'
	out += '\n'.join(f'\tconst FISHGROUP_{convert_data_name(name)}' for name in fishing_tables)
	out += '\nNUM_FISHGROUPS EQU const_value - 1'
	data = re.sub(r'; FishGroups indexes[\s\S]*NUM_FISHGROUPS EQU const_value - 1', out, data)
	path = 'map_data_constants.asm'
	if not output_to_local:
		path = '../constants/' + path
	with open(path, 'w') as f:
		f.write(data)

	with open('../data/maps/maps.asm') as f:
		data = f.read()
	for route in routes:
		name = route.title().replace('_', '')
		if name in ['WhirlIslandNw', 'WhirlIslandNe', 'WhirlIslandSw', 'WhirlIslandSe']:
			name = name[:-1] + name[-1].upper()
		if name not in data:
			print(f'Unknown route: {name}')
			continue
		pattern = rf'\tmap {name}([^\n]+)FISHGROUP_\w+'
		data = re.sub(pattern, rf'\tmap {name}\1FISHGROUP_{convert_data_name(routes[route]["fishing"])}', data)

	path = 'maps.asm'
	if not output_to_local:
		path = '../data/maps/' + path
	with open(path, 'w') as f:
		f.write(data)

	return routes



if __name__ == '__main__':
	main()
