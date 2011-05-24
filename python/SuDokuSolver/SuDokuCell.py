__author__="Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__="2 May 2006 - 11 Dec 2006"
__version__="0.0.1"

class SuDokuCell:
	BLANK="Blank"
	GIVEN="Given"

	def __init__(self, value=1, mode="Blank"):
		self.setValue(value)
		self.setMode(mode)

	def text2cell(self, text):
		if text[0]=="[" and text[2]=="]":
			self.setMode(self.GIVEN)
		elif text[0]=="_" and text[2]=="_":
			self.setMode(self.BLANK)

		self.setValue(int(text[1]))

	def setValue(self, value):
		self.value=value
	def setMode(self, mode):
		self.mode=mode

	def getValue(self):
		return self.value
	def getMode(self):
		return self.mode

	def __repr__(self):
		if self.getMode()==self.BLANK:
			return "_"+str(self.getValue())+"_"

		return "["+str(self.getValue())+"]"
