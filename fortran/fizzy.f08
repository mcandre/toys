! Compile:
! gfortran -o fizzy fizzy.f08 
!
! Run:
! ./fizzy

program fizzy

character(len=8) :: fzbz

do i = 1, 100
	fzbz = fizzbuzz(i)
	print, fzbz
end do

end program

function fizzbuzz(n) result(res)
	character(len=8) :: res
	integer :: n

	if (modulo(n, 15) .eq. 0) then
		res = "FizzBuzz"
	else if (modulo(n, 3) .eq. 0) then
		res = "Fizz"
	else if (modulo(n, 5) .eq. 0) then
		res = "Buzz"
	else
		write(res, "(i10)") n
	endif

	return
end function