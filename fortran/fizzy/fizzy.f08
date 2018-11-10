function fizzbuzz(n) result(res)
    character(len=8) :: res
    integer, intent(in) :: n

    if (modulo(n, 15) .eq. 0) then
        res = "FizzBuzz"
    else if (modulo(n, 3) .eq. 0) then
        res = "Fizz"
    else if (modulo(n, 5) .eq. 0) then
        res = "Buzz"
    else
        write(res, "(i8)") n
    endif

    return
end function fizzbuzz

program fizzy
    character(len=8) :: fizzbuzz
    character(len=8) :: fzbz

    do i = 1, 100
        fzbz = fizzbuzz(i)
        print *, fzbz
    end do

end program fizzy
