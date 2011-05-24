import sys

import pygame

pygame.init()

screen=pygame.display.set_mode((800, 400))

screenrect=screen.get_rect()

black=(0, 0, 0)
red=(255, 0, 0)

font=pygame.font.Font(None, screenrect.width/10)

while True:
	for event in pygame.event.get():
		if event.type==pygame.QUIT:
			sys.exit()

	mousepos=str(pygame.mouse.get_pos())

	text=font.render(mousepos, 1, red)

	textrect=text.get_rect()
	textrect.centerx=screenrect.centerx
	textrect.centery=screenrect.centery

	screen.fill(black)

	screen.blit(text, textrect)

	pygame.display.flip()
