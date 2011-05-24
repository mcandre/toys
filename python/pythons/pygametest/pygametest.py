#!/usr/bin/env python

import pygame

import sys, time

def main():
	pygame.init()

	width, height=320, 240
	size=width, height
	speed=[1, 1]
	black=0, 0, 0

	screen=pygame.display.set_mode(size)
	icon=pygame.image.load("ball icon.png")
	pygame.display.set_icon(icon)

	ball=pygame.image.load("ball.png").convert()
	ballrect=ball.get_rect()

	while True:
		for event in pygame.event.get():
			if event.type==pygame.QUIT:
				sys.exit()

		screen.fill(black, ballrect)

		ballrect=ballrect.move(speed)
		if ballrect.left<0 or ballrect.right>width:
			speed[0]=-speed[0]
		if ballrect.top<0 or ballrect.bottom>height:
			speed[1]=-speed[1]

		for i in range(5000):
			time.sleep(0.000001)

		screen.fill(black, ballrect)
		screen.blit(ball, ballrect)

		pygame.display.flip()

if __name__=="__main__":
	main()
