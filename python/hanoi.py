#!/usr/bin/env python3

import time

START = 0
AUX = 1
END = 2

def hanoi(n, start, aux, end):
	if n == 1:
		return (start, end)

	return (
		hanoi(n - 1, start, aux, end) +
		(start, aux) +
		hanoi(n - 1, aux, end, start)
	)

def main():
	n = int(input("N = "))

	print("Running")

	startt = time.time()

	hanoi(n, START, AUX, END)

	endt = time.time()

	print("Time = %d sec" % (endt - startt))

	#print("Steps = %s" % str(steps))

if __name__ == "__main__":
	try:
		main()
	except KeyboardInterrupt:
		pass