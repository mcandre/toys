#!/usr/bin/env python

"""Ruler drawer"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "23 Jan 2007 - 6 Feb 2007"
__copyright__ = "Copyright 2007 Andrew Pennebaker"

import pygame
import sys


def draw_ruler(screen, color, start, ruler_max, ruler_min, parts):
    """Blot ruler"""

    screenrect = screen.get_rect()

    width, height = screenrect.width, screenrect.height

    bottom = height

    for i in range(parts - 1):
        markerrect = pygame.Rect(
            start - (width / parts) * i, bottom - ruler_max, 1, ruler_max
        )

        screen.fill(color, markerrect)

    for i in range(parts - 1):
        markerrect = pygame.Rect(
            start + (width / parts) * i, bottom - ruler_max, 1, ruler_max
        )

        screen.fill(color, markerrect)

    parts *= 2
    ruler_max /= 2

    if int(ruler_max) > ruler_min:
        draw_ruler(screen, color, start, ruler_max, ruler_min, parts)


def play(screen, screensync=True, fps=128):
    """Tick"""

    black = (0, 0, 0)
    red = (255, 0, 0)

    screenrect = screen.get_rect()
    height = screenrect.height

    clock = pygame.time.Clock()

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    sys.exit()

        mousepos = pygame.mouse.get_pos()

        screen.fill(black)
        draw_ruler(screen, red, mousepos[0], height - mousepos[1], 1, 2)

        if screensync:
            clock.tick(fps)

        pygame.display.flip()


def main():
    """Show ruler"""

    pygame.init()
    pygame.mouse.set_visible(False)

    resolution = (1024, 768)
    fullscreen = True

    screensync = True
    fps = 128

    screen = None

    if fullscreen:
        screen = pygame.display.set_mode(resolution, pygame.FULLSCREEN)
    else:
        screen = pygame.display.set_mode(resolution)

    play(screen, screensync, fps)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
