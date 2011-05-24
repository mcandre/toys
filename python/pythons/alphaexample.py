#!/usr/bin/env python

import pygame

WIDTH = 800
HEIGHT = 600
bg = None

def Init():
     global bg, font
     pygame.init()
     bg = pygame.display.set_mode((WIDTH, HEIGHT), 0, 32)
     font = pygame.font.Font(None, 18)

def Run():
     bgcolor1 = (255, 255, 255)
     bgcolor2 = (192, 192, 192)
     bgcolor3 = (128, 128, 128)
     nightcolor = [0, 0, 0, 64]

     # Create a bitmap - assume this is an expensive operation
     # taking a few seconds.
     bitmap = pygame.Surface((100, 100), pygame.SRCALPHA, 32).convert_alpha()
     pygame.draw.circle(bitmap, (0, 255, 255), [50, 50], 50, 0)
     bitmappos = [0, 0]

     # Create the nighttime overlay
     night = pygame.Surface((WIDTH, HEIGHT/3), pygame.SRCALPHA, 32).convert_alpha()
     night.fill(nightcolor)

     # Loop forever
     quitgame = 0
     while not quitgame:
         pygame.event.pump()

         # Fill background
         bg.fill(bgcolor1, (0, 0, WIDTH, HEIGHT/3))
         Print(bg, 'I want to darken the circle only. (Move the mouse left and right to test.)', (0, 10))
         Print(bg, 'Moving the mouse up here uses overlay method 1, which overlays the background and circle.', (0, 25))
         Print(bg, 'This method is fast, but undesirable because it colors the background.', (0, 40))
         bg.fill(bgcolor2, (0, HEIGHT*1/3, WIDTH, HEIGHT/3))
         Print(bg, "Moving the mouse up here uses overlay method 2, which overlays the circle only, but also destroys the circle's alpha channel.", (0, HEIGHT/3+10))
         bg.fill(bgcolor3, (0, HEIGHT*2/3, WIDTH, HEIGHT/3))
         Print(bg, 'Moving the mouse down here uses overlay method 3, which overlays the circle only, but is very slow.', (0, HEIGHT*2/3+10))
         Print(bg, "Do you know of a faster way to darken the bitmap, without modifying the original picture?", (0, HEIGHT*2/3+25))

         # Render night (the part in question)
         if bitmappos[1] < HEIGHT/3:
             # Method that colors it all include the background
             bg.blit(bitmap, (bitmappos[0]-50, bitmappos[1]-50))
             bg.blit(night, (0, 0))
         elif bitmappos[1] < HEIGHT*2/3:
             # Method that colors only the circle but destroys its alpha channel
             w, h = bitmap.get_size()
             temp = pygame.Surface((w, h), pygame.SRCALPHA, 32).convert_alpha()
             temp.blit(bitmap, (0, 0))
             temp.blit(night, (0, 0))
             bg.blit(temp, (bitmappos[0]-50, bitmappos[1]-50))
         else:
             # Method that colors only the circle, but is too slow
             w, h = bitmap.get_size()
             temp = pygame.Surface((w, h), pygame.SRCALPHA, 32).convert_alpha()
             temp.blit(bitmap, (0, 0))
             temp.blit(night, (0, 0))
             pygame.surfarray.pixels_alpha(temp)[:, :] = pygame.surfarray.pixels_alpha(bitmap)
             bg.blit(temp, (bitmappos[0]-50, bitmappos[1]-50))

         pygame.display.update()

         # Look for quit
         for e in pygame.event.get():
             if e.type in [pygame.QUIT, pygame.MOUSEBUTTONDOWN]:
                 quitgame = 1
                 break
             elif e.type == pygame.KEYDOWN:
                 if e.key == 27:
                     quitgame = 1
                     break
             elif e.type == pygame.MOUSEMOTION:
                 bitmappos = e.pos
                 nightcolor[3] = e.pos[0]/float(WIDTH) * 255
                 night.fill(nightcolor)

def Print(bg, text, loc):
     fontcolor = (0, 0, 0)
     pic = font.render(text, 1, fontcolor)
     bg.blit(pic, loc)

def Terminate():
     pygame.quit()

def main():
     Init()
     Run()
     Terminate()

main()
