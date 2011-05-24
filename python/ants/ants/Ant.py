__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="18 May 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"

import random

import pygame

class Ant:
	COLOR=(0x00, 0x00, 0x00)
	VISITED_TRAIL_COLOR=(0xee, 0x00, 0x00)
	FOOD_TRAIL_COLOR=(0x00, 0xee, 0x00)

	DEVIATION=0.2

	MAX_VISITED_TRAIL=40
	MAX_FOOD_TRAIL=400

	MAX_AGE=1000

	def __init__(self, loc, v=[0, 0]):
		self.loc=loc
		self.v=v

		self.is_alive=True
		self.age=0

		self.width=1
		self.height=1

		self.visited_trail=[]
		self.food_trail=[]
		self.has_found_food=False

	def get_rect(self):
		return pygame.Rect(self.loc[0], self.loc[1], self.width, self.height)

	def check_for_walls(self, env):
		if self.loc[0]>=env.lengths["right"] or self.loc[0]<=env.lengths["left"]:
			self.v[0]*=-1
		if self.loc[1]>=env.lengths["bottom"] or self.loc[1]<=env.lengths["top"]:
			self.v[1]*=-1

	def move(self, v, env):
		self.check_for_walls(env)

		self.loc[0]=self.loc[0]+v[0]
		self.loc[1]=self.loc[1]+v[1]

	def reverse(self):
		self.v[0]=-self.v[0]
		self.v[1]=-self.v[1]

	def check_for_deviation(self):
		if random.random()<self.DEVIATION:
			self.v=random.choice([[0, 1], [1, 0], [0, -1], [-1, 0]])

	def check_for_food(self, env):
		for area in env.food_areas:
			if self.get_rect().colliderect(area):
				self.has_found_food=True
				self.reverse()

				break

		if not self.has_found_food:
			# if ant smells trail to food, do not deviate
			for ant in env.ants:
				if tuple(self.loc) in ant.food_trail:
					break
			else:
				self.check_for_deviation()

	def check_for_home(self, env):
		self.check_for_food(env)

		if self.get_rect().colliderect(env.home):
			self.has_found_food=False
			self.reverse()
		else:
			# if ant smells trail to home, do not deviate
			if not tuple(self.loc) in self.visited_trail:
				self.check_for_deviation()

	def check_age(self):
		if self.age>=self.MAX_AGE:
			self.is_alive=False

	def remove_old_trails(self):
		if len(self.visited_trail)>self.MAX_VISITED_TRAIL:
			self.visited_trail=self.visited_trail[1:]
		if len(self.food_trail)>self.MAX_FOOD_TRAIL:
			self.food_trail=self.food_trail[1:]

	def update(self, env):
		self.check_age()

		if self.is_alive:
			if not self.has_found_food:
				self.check_for_food(env)
			else:
				self.check_for_home(env)

			if not self.has_found_food:
				self.visited_trail.append(tuple(self.loc))
			else:
				self.food_trail.append(tuple(self.loc))

			self.move(self.v, env)

		self.remove_old_trails()