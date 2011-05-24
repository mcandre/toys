import thread

bowl=None
bowlLock=None

def eat(n, m):
	global bowl, bowlLock

	while True:
		bowlLock.acquire()
		bowl-=n
		print "Ate %d" % (n)

		if bowl<m:
			break

	bowlLock.release()

def pour(n, m):
	global bowl, bowlLock

	while True:
		bowlLock.acquire()
		bowl+=n
		print "Poured %d" % (n)

		if bowl>m:
			break

	bowlLock.release()

def monitor(n, m):
	global bowl, bowlLock

	while True:
		bowlLock.acquire()
		print "Contains %d" % (bowl)

		if bowl<n or bowl>m:
			break

	bowlLock.release()

def main():
	global bowl, bowlLock

	bowl=15
	bowlLock=thread.allocate_lock()

	thread.start_new_thread(eat, (2, 5))
	thread.start_new_thread(pour, (8, 25))
	thread.start_new_thread(monitor, (2, 25))

if __name__=="__main__":
	main()