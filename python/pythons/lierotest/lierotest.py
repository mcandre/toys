#!/usr/bin/env python

import pygame

import sys
import time


def main():
    pygame.init()

    width, height = 320, 240
    size = width, height

    screen = pygame.display.set_mode(size)
    icon = pygame.image.load("single.png")
    pygame.display.set_icon(icon)

    black = 0, 0, 0

    worm = pygame.image.load("single.png").convert()
    wormrect = worm.get_rect()
    wormrect.bottom = screen.get_rect().bottom

    speed = [1, 0]

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit()

        screen.fill(black, wormrect)

        wormrect = wormrect.move(speed)

        if wormrect.left < 0 or wormrect.right > width:
            speed[0] = -speed[0]

        time.sleep(0.000002)

        screen.fill(black, wormrect)
        screen.blit(worm, wormrect)

        pygame.display.flip()

if __name__ == "__main__":
    main()
