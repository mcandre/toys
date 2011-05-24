import random

def flip(sequence, howmany):
	a=sequence[:howmany]
	a.reverse()
	return a+sequence[howmany:]

def disordered(sequence):
	for i in range(1, len(sequence)-1):
		if sequence[i-1] > sequence[i]:
			return True

	return False

inp=range(1, 10)
numbers=[]
for i in range(len(inp)):
	numbers.append(inp.pop(random.randint(0, len(inp)-1)))

count=0
while disordered(numbers):
	print " ".join([str(e) for e in numbers])
	howmany=raw_input("How many to flip? ")
	howmany=int(howmany)
	numbers=flip(numbers, howmany)
	count+=1

print "Done! That took you %d steps." % (count)