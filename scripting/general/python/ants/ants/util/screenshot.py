__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '8 Jan 2007 - 22 Jan 2007'
__copyright__ = 'Copyright 2007 Andrew Pennebaker'
__version__ = '0.0.1'

import pygame

import os
import time


def save(surface, directory):
    timestring = '.'.join(time.asctime().split(':'))
    pygame.image.save(
        surface,
        directory + os.sep + 'screenshot ' + timestring + '.bmp'
    )
