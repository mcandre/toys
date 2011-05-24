#!/usr/bin/env python

import time, os, sys

def alert():
	os.popen("open nads.wav") # helps if OS = Mac and nads.wav is set to open with Play Sound.app

secs=int(sys.argv[1])

start=time.time()
while time.time()-start<secs: pass

alert()

sys.exit()