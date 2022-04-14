#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 learnset_importer.py -L="Trainer Sheet - Learnsets.csv" -E="Trainer Sheet - Evolutions.csv" -O="../data/pokemon/evos_attacks.asm"

Rips the contents of a provided csv containing trainer data and produces code.
If -L is given, use that as the learnsets csv instead of the default
If -E is given, use that as the evolutions csv instead of the default
If -O is given, output to specified file, otherwise directly to code.
"""

import csv
import sys

from pokemon_data import *

def main():
  learn_path = 'Mastersheet - Learnsets.csv'
  evo_path = 'Mastersheet - Evolutions.csv'
  out_path = '../data/pokemon/evos_attacks.asm'
  for arg in sys.argv[1:]:
    if arg.startswith('-O='):
      out_path = arg[3:].strip('"')
    elif arg.startswith('-L='):
      learn_path = arg[3:].strip('"')
    elif args.startswith('-E='):
      evo_path = arg[3:].strip('"')

  errors = []
  learnsets = {}
  with open(learn_path) as f:
    reader = csv.DictReader(f)
    mon = ''
    moves = []
    for i, row in enumerate(reader):
      if row['Name/Level'].isnumeric():
        if mon == '':
          errors.append('Moves given before first pokemon')
          continue
        level = int(row['Name/Level'])
        if moves and level < moves[-1][0]:
          errors.append(f'Moves out of order on {mon}')
        if row['Move'] == '':
          errors.append(f'No move given for level {level} on {mon}')
          continue
        move = row['Move']
        if move not in MOVES:
          errors.append(f'Unknown move {move} at level {level} on {mon}')
          continue
        moves.append((level, convert_data_name(move)))
      else:
        if row['Name/Level'] == '':
          errors.append(f'Empty Name/Level column at row {i+1}')
          continue
        name = row['Name/Level']
        if name not in POKEMON:
          errors.append(f'Unknown pokemon "{name}" has learnset')
        if mon:
          learnsets[convert_data_name(mon)] = moves
        moves = []
        mon = name
    learnsets[convert_data_name(mon)] = moves

  evos = {}
  with open(evo_path) as f:
    reader = csv.DictReader(f)
    errored = False
    for row in reader:
      if row['Unevolved Form'] == '':
        continue
      unevolved = row['Unevolved Form']
      evolved = row['Evolved Form']
      if unevolved not in POKEMON:
        errors.append(f'Unknown pokemon "{unevolved}" has evolution')
      if evolved not in POKEMON:
        errors.append(f'Unknown pokemon "{unevolved}" is evolved to')
      if convert_data_name(unevolved) not in evos:
        evos[convert_data_name(unevolved)] = []
      method = row['Method']
      if method in ['Level', 'Hitmonchan', 'Hitmonlee', 'Hitmontop']:
        if not row['Level'].isnumeric():
          errors.append(f'Pokemon "{unevolved}" has non-integer evo level')
          continue
        if row['Item']:
          errors.append(f'Pokemon "{unevolved}" has non-item evolution with item')
        evos[convert_data_name(unevolved)].append({'method': method, 'data': row['Level'], 'target': convert_data_name(evolved)})
      elif method in ['Item', 'Trade']:
        if row['Item'] not in ITEMS:
          errors.append(f'Pokemon "{unevolved}" has unknown evolution item')
          continue
        if row['Level']:
          errors.append(f'Pokemon "{unevolved}" has level with non-level evo')
        evos[convert_data_name(unevolved)].append({'method': method, 'data': convert_data_name(row['Item']), 'target': convert_data_name(evolved)})
      elif method == 'Happiness':
        if row['Level']:
          errors.append(f'Pokemon "{unevolved}" has level with non-level evo')
        if row['Item']:
          errors.append(f'Pokemon "{unevolved}" has non-item evolution with item')
        evos[convert_data_name(unevolved)].append({'method': method, 'data': 'TR_ANYTIME', 'target': convert_data_name(evolved)})
      else:
        errors.append(f'Unknown evo method "{method}"')

  if errors:
    print('\n'.join(errors))
    return

  out = '''INCLUDE "constants.asm"


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

'''
  pokemon_data = []
  for mon in learnsets:
    def_name = mon.title().replace('_', '')
    lines = [f'{def_name}EvosAttacks:']
    mon = convert_data_name(mon)
    if mon in evos:
      for evo in evos[mon]:
        if evo['method'] in ['Level', 'Item', 'Happiness', 'Trade']:
          lines.append(f'\tdb EVOLVE_{evo["method"].upper()}, {evo["data"]}, {evo["target"]}')
        elif evo['method'].startswith('Hitmon'):
          key = {'Hitmonchan': 'ATK_LT_DEF', 'Hitmonlee': 'ATK_GT_DEF', 'Hitmontop': 'ATK_EQ_DEF'}
          lines.append(f'\tdb EVOLVE_STAT, {evo["data"]}, {key[evo["method"]]}, {evo["target"]}')
    lines.append('\tdb 0 ; no more evolutions')
    for move in learnsets[mon]:
      lines.append(f'\tdb {move[0]}, {move[1]}')
    lines.append('\tdb 0 ; no more level-up moves')
    pokemon_data.append('\n'.join(lines))

  out += '\n\n'.join(pokemon_data) + '\n'

  with open(out_path, 'w') as f:
    f.write(out)

if __name__ == '__main__':
  main()
