#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 trainer_converter.py ["Trainer Sheet - As in documentation.csv"] -o=<filename>

Rips the contents of a provided csv containing trainer data and produces code.
If -o and filename are provided, outputs to file given
"""

import csv
import re
import sys

def codeify_name(string):
	return string.upper().replace(' ', '_')

HIDDEN_POWERS = {
  'FIGHTING': '$CC',
  'FLYING': '$CD',
  'POISON': '$CE',
  'GROUND': '$CF',
  'ROCK': '$DC',
  'BUG': '$DD',
  'GHOST': '$DE',
  'STEEL': '$DF',
  'FIRE': '$EC',
  'WATER': '$ED',
  'GRASS': '$EE',
  'ELECTRIC': '$EF',
  'PSYCHIC': '$FC',
  'ICE': '$FD',
  'DRAGON': '$FE',
  'DARK': 'PERFECT_DV'
}

def main():
	path = 'Trainer Sheet - Trainers.csv'
	o_path = '../data/trainers/parties.asm'
	for arg in sys.argv[1:]:
		if arg.startswith('-o='):
			o_path = arg[3:]
		else:
			path = arg

	errored = False
	trainers = {}
	with open(path) as f:
		reader = csv.DictReader(f)
		t_name = ''
		t_moves = False
		t_items = False
		pokemon = []
		for row in reader:
			if row['Trainer']:
				if pokemon:
					trainers[t_name] = {'moves': t_moves, 'items': t_items, 'pokemon': pokemon}
				t_name = row['Trainer']
				t_moves = False
				t_items = False
				pokemon = []
			if row['Pokemon']:
				if row['Level'] == '':
					print(f'{row["Pokemon"]} of {t_name} has no level, skipping pokemon')
					errored = True
					continue
				if row['Item']:
					t_items = True
				if row['Move 1']:
					t_moves = True
				pokemon.append({'species':codeify_name(row['Pokemon']), 'level':row['Level'], 'item':codeify_name(row['Item']),
					'moves':[codeify_name(row['Move 1']), codeify_name(row['Move 2']), codeify_name(row['Move 3']), codeify_name(row['Move 4'])]})
		if pokemon:
			trainers[t_name] = {'moves': t_moves, 'items': t_items, 'pokemon': pokemon}

	if errored:
		print('Errored while reading CSV, ending')
		return
	
	groups = {}
	for trainer in trainers:
		parts = trainer.split(' ')
		group = parts[0]
		id_ = int(parts[2][1:-1])
		comment = '; ' + parts[1] + ' ' + parts[2]
		name = ' '.join(parts[3:])
		if group not in groups:
			groups[group] = []
			if group == 'Rival1':
				groups['PokemonProf'] = []
		groups[group].append({'id': id_, 'comment': comment, 'name': name, 'moves': trainers[trainer]['moves'], 'items': trainers[trainer]['items'], 'pokemon': trainers[trainer]['pokemon']})
	for group in groups:
		groups[group] = sorted(groups[group], key=lambda x:x['id'])

	output = '''; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constants |ed together
; - 1 to 6 Pokémon:
;    * in all cases:               db level, species
;    * for TRAINERTYPE_DVS:        db atk|def dv, spd|spc dv
;    * for TRAINERTYPE_ITEM:       db item
;    * for TRAINERTYPE_MOVES:      db 4 moves
;    (TRAINERTYPE_ITEM_MOVES is just TRAINERTYPE_ITEM | TRAINERTYPE_MOVES)
; - db -1 ; end

SECTION "Enemy Trainer Parties 1", ROMX

'''
	
	for group in groups:
		output += f'{group}Group:\n'
		if not groups[group]:
			output += '\n'
		for trainer in groups[group]:
			output += f'\t{trainer["comment"]}\n'
			output += f'\tdb "{trainer["name"]}@", '
			ttypes = ['TRAINERTYPE_DVS']
			if trainer['moves']:
				ttypes.append('TRAINERTYPE_MOVES')
			if trainer['items']:
				ttypes.append('TRAINERTYPE_ITEM')
			output += ' | '.join(ttypes)
			output += '\n'
			for pokemon in trainer['pokemon']:
				hp_dv = 'PERFECT_DV'
				for i in range(4):
					if pokemon['moves'][i] == '':
						pokemon['moves'][i] = 'NO_MOVE'
					if pokemon['moves'][i].startswith('HIDDEN_POWER_('):
						hp_type = re.match('HIDDEN_POWER_\((\w+)\)', pokemon['moves'][i]).group(1)
						if hp_type not in HIDDEN_POWERS:
							print(f'Unknown hidden power type {hp_type}')
						else:
							hp_dv = HIDDEN_POWERS[hp_type]
						pokemon['moves'][i] = 'HIDDEN_POWER'

				output += f'\tdb {str(pokemon["level"]).rjust(2)}, {pokemon["species"]}, {hp_dv}, PERFECT_DV'
				length = len(pokemon['species'])
				joiner = f',{" "*(11-length)}'
				if trainer['items']:
					if pokemon['item'] == '':
						pokemon['item'] = 'NO_ITEM'
					output += f'{joiner}{pokemon["item"]}'
					length = len(pokemon["item"])
					joiner = f',{" "*(13-length)}'
				if trainer['moves']:
					output += joiner
					output += ', '.join(pokemon['moves'])
				output += '\n'
			output += '\tdb -1 ; end\n\n'
	
	output = output[:-1]

	with open(o_path, 'w') as f:
		f.write(output)

if __name__ == '__main__':
	main()
