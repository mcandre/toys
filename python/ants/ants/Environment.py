__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="18 May 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"

from ants.util import screenlengths

import random

import pygame

class Environment:
	DIRT_COLOR=(0x87, 0x42, 0x1f)
	HOME_COLOR=(0x00, 0xcf, 0xcf)
	FOOD_COLOR=(0xcf, 0xcf, 0x00)

	def __init__(self, screen, ants, foodcount=2, foodsize=30):
		self.screen=screen
		self.lengths=screenlengths.get_lengths(screen)

		self.home=self.generate_home()

		self.ants=ants

		self.food_areas=self.generate_food(foodcount, foodsize)

		self.food=[]

	def generate_home(self):
		return pygame.Rect(
			self.lengths["midX"]-20,
			self.lengths["midY"]-20,
			40,
			40
		)

	def generate_food(self, foodcount, foodsize):
		areas=[None for i in range(foodcount)]

		for i in range(foodcount):
			area=pygame.Rect(
					random.choice(range(self.lengths["width"])),
					random.choice(range(self.lengths["height"])),
					foodsize,
					foodsize
			)

			while area.colliderect(self.home):
				area=pygame.Rect(
						random.choice(range(self.lengths["width"])),
						random.choice(range(self.lengths["height"])),
						foodsize,
						foodsize
				)

			areas[i]=area

		return areas

	def update(self):
		for ant in self.ants:
			ant.update(self)