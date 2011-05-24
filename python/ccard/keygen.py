import keycheck

from random import random

def gen(length=16):
	number=""

	for i in range(length):
		number+=str(int(random()*10))

	modulo=keycheck.sum(int(number))%10
	if modulo>0:
		number=number[:length-1]+str(10-modulo)

	return int(number)
