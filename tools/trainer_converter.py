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

	if errored:
		print('Errored while reading CSV, ending')
		return
	
	groups = {}
	for trainer in trainers:
		parts = trainer.split(' ')
		group = parts[0]
		id_ = int(parts[2][1:-1])
		comment = '; ' + parts[1] + ' ' + parts[2]
		name = parts[3]
		if group not in groups:
			groups[group] = []
		groups[group].append({'id': id_, 'comment': comment, 'name': name, 'moves': trainers[trainer]['moves'], 'items': trainers[trainer]['items'], 'pokemon': trainers[trainer]['pokemon']})
	for group in groups:
		groups[group] = sorted(groups[group], key=lambda x:x['id'])

	output = '''INCLUDE "data/trainers/party_pointers.asm"

Trainers:
; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

'''
	
	for group in groups:
		output += f'{group}Group:\n'
		for trainer in groups[group]:
			output += f'\t{trainer["comment"]}\n'
			output += f'\tdb "{trainer["name"]}@", TRAINERTYPE_'
			if trainer['moves'] and trainer['items']:
				ttype = 'ITEM_MOVES'
			elif trainer['moves']:
				ttype = 'MOVES'
			elif trainer['items']:
				ttype = 'ITEM'
			else:
				ttype = 'NORMAL'
			output += f'{ttype}\n'
			for pokemon in trainer['pokemon']:
				output += f'\tdb {pokemon["level"]}, {pokemon["species"]}'
				length = len(pokemon['species'])
				if trainer['items']:
					output += f',{" "*(11-length)}{pokemon["item"]}'
				if trainer['moves']:
					output += f',{" "*(13-length)}'
					output += ', '.join(pokemon['moves'])
				output += '\n'
			output += '\tdb -1 ; end\n\n'
	
	output = output[:-1]

	with open(o_path, 'w') as f:
		f.write(output)

if __name__ == '__main__':
	main()
