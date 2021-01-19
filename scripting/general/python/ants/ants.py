#!/usr/bin/env python

'''2d ant simulation'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '18 May 2007'
__copyright__ = 'Copyright 2007 Andrew Pennebaker'
__version__ = '0.0.1'

from ants import Ant, Environment
from ants.util import configreader, screenlengths, screenshot

import pygame

import sys
import random


def play(screen, settings):
    '''Tick'''

    clock = pygame.time.Clock()

    lengths = screenlengths.get_lengths(screen)

    ants = [
        Ant.Ant(
            [
                lengths['midX'] + random.choice(range(-5, 5)),
                lengths['midY'] + random.choice(range(-5, 5))
            ],
            random.choice(
                [[0, 1], [1, 0], [0, -1], [-1, 0]]
            )
        )

        for i in range(settings['antcount'])
    ]

    env = Environment.Environment(
        screen,
        ants,
        settings['foodcount'],
        settings['foodsize']
    )

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit()
            elif event.type == pygame.KEYDOWN:
                if event.key == settings['keyescape']:
                    sys.exit()
                elif (
                        event.key == pygame.K_q and
                        event.mod == pygame.KMOD_LMETA or
                        event.mod == pygame.KMOD_RMETA
                ):  # Command+Q
                    sys.exit()
                elif event.key == settings['keyscreenshot']:
                    screenshot.save(screen, settings['screenshotdir'])

        env.update()

        screen.fill(env.DIRT_COLOR)

        screen.fill(env.HOME_COLOR, env.home)

        for rect in env.food_areas:
            screen.fill(env.FOOD_COLOR, rect)

        # for ant in ants:
        #     for pos in ant.visited_trail:
        #      screen.fill(
        #          ant.VISITED_TRAIL_COLOR,
        #          pygame.Rect(pos[0], pos[1], 1, 1)
        #      )

        for ant in ants:
            for pos in ant.food_trail:
                screen.fill(
                    ant.FOOD_TRAIL_COLOR,
                    pygame.Rect(pos[0], pos[1], 1, 1)
                )

        for ant in ants:
            if ant.is_alive:
                screen.fill(ant.COLOR, ant.get_rect())

        if settings['screensync']:
            clock.tick(settings['fps'])

        pygame.display.flip()


def main():
    '''Run simulation'''

    pygame.init()

    pygame.mouse.set_visible(False)

    settings = {
        'screensync': True,
        'fps': 16,
        'fullscreen': False,
        'resolution': (800, 600),
        'screenshotdir': 'screens',
        'antcount': 10,
        'foodcount': 2,
        'foodsize': 30,
        'keyescape': pygame.K_ESCAPE,
        'keyscreenshot': pygame.K_0
    }

    configreader.read(open('ants.conf', 'r'), settings)

    screen = None

    if settings['fullscreen']:
        screen = pygame.display.set_mode(
            settings['resolution'],
            pygame.FULLSCREEN
        )
    else:
        screen = pygame.display.set_mode(
            settings['resolution']
        )

    # icon = pygame.image.load(
    #     settings['gfxdir'] + os.sep + settings['icon']
    # ).convert_alpha()
    # pygame.display.set_icon(icon)

    pygame.display.set_caption('Ants')

    play(screen, settings)

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt as e:
        pass
