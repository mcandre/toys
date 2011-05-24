#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="23 Jan 2007 - 6 Feb 2007"
__copyright__="Copyright 2007 Andrew Pennebaker"

import sys

import pygame

def drawRuler(screen, color, start, max, min, parts):
	screenrect=screen.get_rect()

	width, height=screenrect.width, screenrect.height

	top, bottom=0, height
	left, right=0, width

	for i in range(parts-1):
		markerrect=pygame.Rect(start-(width/parts)*i, bottom-max, 1, max)

		screen.fill(color, markerrect)

	for i in range(parts-1):
		markerrect=pygame.Rect(start+(width/parts)*i, bottom-max, 1, max)

		screen.fill(color, markerrect)

	parts*=2
	max=max/2

	if int(max)>min:
		drawRuler(screen, color, start, max, min, parts)

def play(screen, screensync=True, fps=128):
	black=(0, 0, 0)
	red=(255, 0, 0)

	screenrect=screen.get_rect()
	width, height=screenrect.width, screenrect.height

	clock=pygame.time.Clock()

	while True:
		for event in pygame.event.get():
			if event.type==pygame.QUIT:
				sys.exit()
			elif event.type==pygame.KEYDOWN:
				if event.key==pygame.K_ESCAPE:
					sys.exit()

		mousepos=pygame.mouse.get_pos()

		screen.fill(black)
		drawRuler(screen, red, mousepos[0], height-mousepos[1], 1, 2)

		if screensync:
			clock.tick(fps)

		pygame.display.flip()

def main():
	pygame.init()
	pygame.mouse.set_visible(False)

	resolution=(1024, 768)
	fullscreen=True

	screensync=True
	fps=128

	screen=None

	if fullscreen:
		screen=pygame.display.set_mode(resolution, pygame.FULLSCREEN)
	else:
		screen=pygame.display.set_mode(resolution)

	play(screen, screensync, fps)

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass