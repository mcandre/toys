#!/usr/bin/env python

import pygame
from pygame.locals import QUIT

import sys


def main():
    pygame.init()

    width, height = 250, 100
    size = width, height

    screen = pygame.display.set_mode(size)

    pygame.display.set_caption('Hello Pygame')

    background = pygame.Surface(screen.get_size()).convert()
    background.fill((250, 250, 250))

    font = pygame.font.Font(None, 36)
    text = font.render('Hello World', 1, (10, 10, 10))
    textpos = text.get_rect()
    textpos.centerx = background.get_rect().centerx
    textpos.centery = background.get_rect().centery
    background.blit(text, textpos)

    screen.blit(background, (0, 0))
    pygame.display.flip()

    while True:
        for event in pygame.event.get():
            if event.type == QUIT:
                sys.exit()

        screen.blit(background, (0, 0))
        pygame.display.flip()

if __name__ == '__main__':
    main()
