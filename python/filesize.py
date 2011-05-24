import sys

def getSize(file):
	try:
		f=open(file, "rb")
	except Exception, e:
		raise e

	bytes=0

	c=f.read(1)

	while c!="":
		bytes+=1
		c=f.read(1)
	f.close()

	return bytes

def usage():
	print "Usage: %s file" % (sys.argv[0])
	sys.exit()

def main():
	if len(sys.argv)<2:
		usage()

	size=0
	try:
		size=getSize(sys.argv[1])
	except Exception, e:
		raise "Could not open %s" % (sys.argv[1])

	print "%d bytes" % (size)

if __name__=="__main__":
	main()