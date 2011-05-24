""" Takes an age and prints corresponding results """

__author__="Andrew Pennebaker"

age=input("Age: ")

if age<1:
	print "You are too young!"
elif age in range(1,13):
	print "You are a child."
elif age in range(13,30):
	print "You are young."
elif age in range(30,100):
	print "You are an adult. Act like it."
elif age in range(100, 125):
	print "That is OLD!"
else:
	print "Possible error. Too old/young?"