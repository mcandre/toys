# http://en.wikipedia.org/wiki/MD5

import math

def md5(data):
	# Note: All variables are unsigned 32 bits and wrap modulo 2^32 when calculating

	r=[0x00]*64
	k=[0x00]*64
	# r specifies the per-round shift amounts	r[0:15] =[7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22]	r[16:31]=[5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20]	r[32:47]=[4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23]	r[48:63]=[6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21]	# Use binary integer part of the sines of integers as constants:	for i range(64):		k[i] = math.floor(abs(math.sin(i+1)) * 2**32)	# Initialize variables:	h0 = 0x67452301	h1 = 0xefcdab89	h2 = 0x98badcfe	h3 = 0x10325476

	# Pre-processing
	# append "1" bit to message	# append "0" bits until message length in bits is 448 (mod 512)	# append bit length of message as 64-bit little-endian integer to message

	oldlen=len(data)
	data.append(0x01)
	while len(data)%56!=0:
		data.append(0x00)
	data.append([oldlen]*8)

	while len(data)>=64:
		chunk=data[:63] # grab 64 bytes = 512 bits
		w=[0x00]*16
		for i in range(16):
			w[i]=chunk[i*16:i*17]

		a=h0
		b=h1
		c=h2
		d=h3

		f=0
		g=0

		for i in range(64):
			if i>=0 and i<=15:
				f=(b&c) | ((!b) & d)
				g=i
	# Process the message in successive 512-bit chunks:	for each 512-bit chunk of message		break chunk into sixteen 32-bit little-endian words w[i], 0  i  15		# Initialize hash value for this chunk:		var int a := h0		var int b := h1		var int c := h2		var int d := h3		# Main loop:		for i from 0 to 63			if 0  i  15 then				f := (b and c) or ((not b) and d)				g := i			else if 16  i  31				f := (d and b) or ((not d) and c)				g := (5Xi + 1) mod 16			else if 32  i  47				f := b xor c xor d				g := (3Xi + 5) mod 16			else if 48  i  63				f := c xor (b or (not d))				g := (7Xi) mod 16		    temp := d		    d := c		    c := b		    b := ((a + f + k[i] + w[g]) leftrotate r[i]) + b		    a := temp		# Add this chunk's hash to result so far:		h0 := h0 + a		h1 := h1 + b 		h2 := h2 + c		h3 := h3 + d	var int digest := h0 append h1 append h2 append h3 # (expressed as little-endian)