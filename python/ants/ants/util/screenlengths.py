"""screenlengths"""

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="11 May 2007 - 18 May 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"
__version__="0.0.1"

def get_lengths(screen):
	screenrect=screen.get_rect()

	width=screenrect.width
	height=screenrect.height

	lengths={
		"width":width,
		"height":height,
		"top":0,
		"bottom":height,
		"left":0,
		"right":width,
		"midX":width/2,
		"midY":height/2
	}

	return lengths