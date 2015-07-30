"""PyGame demo"""

import pygame

import sys

pygame.init()

SCREEN = pygame.display.set_mode((800, 400))

SCREEN_RECT = SCREEN.get_rect()

BLACK = (0, 0, 0)
RED = (255, 0, 0)

FONT = pygame.font.Font(None, SCREEN_RECT.width / 10)

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()

    MOUSE_POS = str(pygame.mouse.get_pos())

    TEXT = FONT.render(MOUSE_POS, 1, RED)

    TEXT_RECT = TEXT.get_rect()
    TEXT_RECT.centerx = SCREEN_RECT.centerx
    TEXT_RECT.centery = SCREEN_RECT.centery

    SCREEN.fill(BLACK)

    SCREEN.blit(TEXT, TEXT_RECT)

    pygame.display.flip()
