#!/usr/bin/env python3

if __name__=="__main__":
	for i in range(99, 1, -1):
		print("%d bottles of beer on the wall, %d bottles of beer.\nTake one down, pass it around, %d bottles of beer on the wall.\n" % (i, i, i-1))

	print("1 bottle of beer on the wall, 1 bottle of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")