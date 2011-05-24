#!/usr/bin/env python

__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="17 Dec 2006 - 18 Jan 2007"
__copyright__="Copyright 2006 2007 Andrew Pennebaker"
__version__="0.0.1"

from tile import tile

import pygame

from random import random

import sys, time

def screenshot(surface):
	timestring=".".join(time.asctime().split(":"))
	pygame.image.save(surface, open("screenshot "+timestring+".bmp", "w"))

def replaceRect(r1, r2):
	top, left=r1.top, r1.left

	r1=r2
	r1.top, r1.left=top, left

def play(keysettings, screen, imagefiles, fps, screensync=True):
	clock=pygame.time.Clock()

	screenrect=screen.get_rect()

	tilefile=imagefiles["tile"]

	background=pygame.Surface(screen.get_size())
	tileimage=pygame.image.load(tilefile).convert_alpha()
	tile(background, tileimage)

	red=(255, 20, 20)
	blue=(0, 50, 200)
	yellow=(255, 255, 0)

	backgroundrect=background.get_rect()

	pausefont=pygame.font.Font(None, screenrect.width/5)
	pausetext=pausefont.render("Paused", 1, yellow)
	pausetextrect=pausetext.get_rect()
	pausetextrect.centerx=screenrect.centerx
	pausetextrect.centery=screenrect.centery

	scorefont=pygame.font.Font(None, screenrect.width/10)

	score=0
	starttime=time.time()

	wormfile=imagefiles["worm"]

	worm=pygame.image.load(wormfile).convert_alpha()

	direction="left"

	wormrect=worm.get_rect()
	wormrect.bottom=screenrect.bottom
	wormrect.centerx=screenrect.centerx

	wormspeed=[-2, 0]

	fireballfile=imagefiles["fireball"]

	fireball=pygame.image.load(fireballfile).convert_alpha()

	fireballcount=(screenrect.width/fireball.get_rect().width)/4+1

	fireballrects=[fireball.get_rect() for i in range(fireballcount)]
	for e in fireballrects:
		e.bottom=0
		e.left=int(random()*(screenrect.width-e.width)+e.width)

	maxfireballspeed=4

	fireballspeeds=[
		(0, int(random()*maxfireballspeed)+1)
		for i in range(len(fireballrects))
	]

	paused=False

	gameover=False
	while not gameover:
		for event in pygame.event.get():
			if event.type==pygame.QUIT:
				sys.exit()
			elif event.type==pygame.KEYDOWN:
				if event.key==keysettings["escape"]:
					sys.exit()
				elif event.key==keysettings["pause"]:
					if paused:
						starttime=time.time()
						paused=False
					else:
						paused=True
				elif event.key==keysettings["screenshot"]:
					screenshot(screen)
				elif not paused:
					if event.key==keysettings["left"]:
						if direction=="right":
							worm=pygame.transform.flip(worm, 1, 0)
							replaceRect(wormrect, worm.get_rect())

							wormspeed[0]=-wormspeed[0]

							direction="left"
					elif event.key==keysettings["right"]:
						if direction=="left":
							worm=pygame.transform.flip(worm, 1, 0)
							replaceRect(wormrect, worm.get_rect())

							wormspeed[0]=-wormspeed[0]

							direction="right"
					elif event.key==keysettings["plus"]:
						temp=fireball.get_rect()
						temp.bottom=0
						temp.left=int(random()*(screenrect.width-e.width)+e.width)
						fireballrects.append(temp)
						fireballspeeds.append((0, int(random()*maxfireballspeed)+1))
					elif event.key==keysettings["minus"]:
						if len(fireballrects)>0 and len(fireballspeeds)>0:
							del fireballrects[-1]
							del fireballspeeds[-1]

		if paused:
			screen.blit(pausetext, pausetextrect)
		else:
			score+=time.time()-starttime
			starttime=time.time()

			scoretext=scorefont.render(str(int(score)), 1, blue)
			scorerect=scoretext.get_rect()
			scorerect.top=screenrect.top+screenrect.height/20
			scorerect.right=screenrect.right-screenrect.width/20

			if wormrect.left>screenrect.left and direction=="left":
				if pygame.key.get_pressed()[keysettings["left"]]:
					wormrect=wormrect.move(wormspeed)
			elif wormrect.right<screenrect.right and direction=="right":
				if pygame.key.get_pressed()[keysettings["right"]]:
					wormrect=wormrect.move(wormspeed)

			for i in range(len(fireballrects)):
				if fireballrects[i].colliderect(wormrect):
					gameover=True
				elif fireballrects[i].top<screenrect.bottom:
					fireballrects[i]=fireballrects[i].move(fireballspeeds[i])
				else:
					fireballrects[i].bottom=int(random()*(screenrect.height-0.75*screenrect.height))
					fireballrects[i].centerx=int(random()*(screenrect.width-50)+25)
					fireballspeeds[i]=(0, int(random()*maxfireballspeed)+1)

			screen.blit(background, backgroundrect)
			screen.blit(worm, wormrect)

			for i in range(len(fireballrects)):
				screen.blit(fireball, fireballrects[i])

			screen.blit(scoretext, scorerect)

		if screensync:
			clock.tick(fps)

		pygame.display.flip()

	gameoverfont=pygame.font.Font(None, screenrect.width/5)
	scoretext=gameoverfont.render("Oh Noes !!!", 1, red)
	textpos=scoretext.get_rect()
	textpos.centerx=screenrect.centerx
	textpos.centery=screenrect.centery

	screen.blit(scoretext, textpos)
	pygame.display.flip()

	return

def main():
	pygame.init()

	pygame.mouse.set_visible(False)

	settings={
		"resolution":(1024, 768),
		"fullscreen":True,
		"icon":"icon.png",
		"fps":96,
		"screensync":True,
		"tile":"dirt.png",
		"worm":"worm.png",
		"fireball":"fireball.png",

		"keyleft":pygame.K_LEFT,
		"keyright":pygame.K_RIGHT,
		"keyescape":pygame.K_ESCAPE,
		"keyscreenshot":pygame.K_F12,
		"keypause":pygame.K_p,
		"keyplus":pygame.K_PLUS,
		"keyminus":pygame.K_MINUS
	}

	try:
		configfile=open("lierododge.conf", "r")
		for line in configfile:
			line=line.strip()

			if "#" in line:
				line=line[:line.index("#")]

			if line:
				key, value=line.split("=")

				settings[key.strip()]=eval(value)
		configfile.close()
	except IOError, e:
		pass

	screen=None

	if settings["fullscreen"]:
		screen=pygame.display.set_mode(settings["resolution"], pygame.FULLSCREEN)
	else:
		screen=pygame.display.set_mode(settings["resolution"])

	iconfile=settings["icon"]

	icon=pygame.image.load(iconfile)
	pygame.display.set_icon(icon)

	imagefiles={
		"tile":settings["tile"],
		"worm":settings["worm"],
		"fireball":settings["fireball"]
	}

	keysettings={}
	for key in settings:
		if key.startswith("key"):
			keysettings[key[3:]]=settings[key]

	while True:
		play(keysettings, screen, imagefiles, settings["fps"], settings["screensync"])

		t=time.time()
		while time.time()-t<3:
			for event in pygame.event.get():
				if event.type==pygame.QUIT:
					return
				if event.type==pygame.KEYDOWN and event.key==pygame.K_ESCAPE:
					return

if __name__=="__main__":
	try:
		main()
	except KeyboardInterrupt, e:
		pass
	except pygame.error, e:
		print e
