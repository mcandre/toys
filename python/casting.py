#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="30 Jan 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"

class GameObject:
	items={}

	def __init__(self, name="Object", description="An object"):
		self.name=name
		self.description=description

	def look(self, args=[]):
		if len(args)==0:
			return self.__repr__()
		elif len(args)>=1:
			item=None
			try:
				item=self.items[args[0]]
			except KeyError:
				return "There is no "+args[0]
			else:
				return item.look()

	def __repr__(self):
		return self.description

class Room(GameObject):
	def __init__(self, name="Room", description="A room"):
		GameObject.__init__(self, name, description)

		self.items["floor"]={}
		self.items["exits"]={}

	def __repr__(self):
		result=self.description

		if len(self.items["floor"].keys())<1:
			result+="\nNo items on floor."
		else:
			result+="\nOn the floor:\n"
			result+="\n".join([value.name for value in self.items["floor"].values()])

		if len(self.items["exits"].keys())<1:
			result+="\nNo exits."
		else:
			result+="\nExits: "
			result+=" ".join([value.name for value in self.items["exits"].values()])

		return result

class Map(GameObject):
	def __init__(self, name="Map", description="A map"):
		GameObject.__init__(self, name, description)

		self.items["rooms"]={}

class Character(GameObject):
	def __init__(self, name="Character", description="A character"):
		GameObject.__init__(self, name, description)

		self.items["maps"]={}
		self.location=""