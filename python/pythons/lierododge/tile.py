def tile(surface, image):
	surfacerect=surface.get_rect()
	imagerect=image.get_rect()

	x, y=imagerect.width, imagerect.height
	width, height=surfacerect.width, surfacerect.height

	for i in range(width/x+1):
		for j in range(height/y+1):
			surface.blit(image, (x*i, y*j))