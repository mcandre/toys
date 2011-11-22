! Compile:
! gfortran -o fizzy fizzy.f08 
!
! Run:
! ./fizzy

program fizzy

interface

function fizzbuzz(n) result(res)
	string :: res
	integer :: n

	! ...
end function

end interface

! ...

end program