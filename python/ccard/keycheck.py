def sum(number):
	sum=0

	alternate=True
	while number>0:
		digit=number%10
		number/=10

		if alternate:
			digit*=2
			if digit>9:
				digit-=9

		sum+=digit

		alternate=not alternate

	return sum

def check(number):
	return sum(number)%10==0
