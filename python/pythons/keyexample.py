#!/usr/bin/env python

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "1 Jan 2007"
__copyright__ = "Copyright 2007 Andrew Pennebaker"
__version__ = "0.0.1"

import pygame


def main():
    pygame.init()

    screen = pygame.display.set_mode((300, 400))
    pygame.display.flip()

    while True:
        for event in pygame.event.get():
            print str(event)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt as e:
        pass
