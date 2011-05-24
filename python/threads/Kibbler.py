#!/usr/bin/env python

import threading

class Dog(threading.Thread):
	id=0

	def __init__(self, bowl, n, m, lock):
		threading.Thread.__init__(self)
		self.bowl=bowl
		self.n=n
		self.m=m
		self.myid=self.id
		Dog.id+=1
		self.bowlLock=lock

	def run(self):
		while True:
			self.bowlLock.acquire()
			self.bowl-=self.n
			self.bowlLock.release()

			print "Dog %d Ate %d" % (self.myid, self.n)

			if self.bowl<self.m:
				break

class Man(threading.Thread):
	id=0

	def __init__(self, bowl, n, m, lock):
		threading.Thread.__init__(self)
		self.bowl=bowl
		self.n=n
		self.m=m
		self.myid=self.id
		Man.id+=1
		self.bowlLock=lock

	def run(self):
		while True:
			self.bowlLock.acquire()
			self.bowl-=self.n
			self.bowlLock.release()

			print "Man %d Gave %d" % (self.myid, self.n)

			if self.bowl>self.m:
				break

		print "Man %d Quit" % (self.myid)

class Monitor(threading.Thread):
	id=0

	def __init__(self, bowl, n, m, lock):
		threading.Thread.__init__(self)
		self.bowl=bowl
		self.n=n
		self.m=m
		self.myid=self.id
		Monitor.id+=1
		self.bowlLock=lock

	def run(self):
		while True:
			self.bowlLock.acquire()
			b=self.bowl+0
			self.bowlLock.release()

			print "Monitor %d Contains %d" % (self.myid, self.bowl)

			if self.bowl<n or self.bowl>m:
				break

		print "Monitor %d Quit" % (self.myid)

def main():
	bowlStart=15
	dogSpeed=2
	dogMin=5
	manSpeed=4
	manMax=25

	bowlLock=threading.Lock()

	t1=Dog(bowlStart, dogSpeed, dogMin, bowlLock)
	t2=Man(bowlStart, manSpeed, manMax, bowlLock)
	t3=Monitor(bowlStart, dogMin, manMax, bowlLock)

	threads=[t1, t2, t3]

	for t in threads:
		t.start()

	# wait for all threads to finish
	for t in threads:
		t.join()

if __name__=="__main__":
	main()