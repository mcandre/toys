import sys
from getopt import getopt

def usage():
	print "Usage: %s [options]" % (sys.argv[0])
	print "\n-a ambulate"
	print "-b bumble"
	print "-c custom"
	print "\n--run walk at a fast pace"
	print "--float walk above the ground"
	print "--Float <file> (float above a file)"
	print "\n-u usage"

	sys.exit()

def main():
	systemArgs=sys.argv[1:] # ignore program name
	optlist, args=getopt(systemArgs, "abc:u", ["run", "float", "Float="])

	if len(optlist)<1:
		usage()

	for option, value in optlist:
		if option=="-u":
			usage()
		elif option=="-a":
			print "ambulating"
		elif option=="-b":
			print "bumbling"
		elif option=="-c":
			print value
		elif option=="--run":
			print "running"
		elif option=="--float":
			print "floating"
		elif option=="--Float":
			print "Floating above %s" % (value)

	for arg in args:
		print "additional argument %s" % (arg)

if __name__=="__main__":
	main()