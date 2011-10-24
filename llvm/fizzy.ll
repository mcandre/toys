@fizzbuzz = internal constant [9 x i8] c"FizzBuzz\00"
@fizz = internal constant [5 x i8] c"Fizz\00"
@buzz = internal constant [5 x i8] c"Buzz\00"
@fmtd = internal constant [4 x i8] c"%d\0A\00"

declare i32 @puts(i8*)
declare i32 @printf(i8*, ...)

define i32 @main() {
	entry:
		%i = alloca i32
		store i32 1, i32* %i
		br label %loop
	loop:
		%ival = load i32* %i
		%m3 = urem i32 %ival, 3
		%m5 = urem i32 %ival, 5

		%d3 = icmp eq i32 %m3, 0
		%d5 = icmp eq i32 %m5, 0
		%d35 = and i1 %d3, %d5

		br i1 %d35, label %fzbz, label %fzorbz
	fzbz:
		call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @fizzbuzz, i32 0, i32 0))
		br label %incr
	fzorbz:
		br i1 %d3, label %fz, label %bzorprnt
	fz:
		call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @fizz, i32 0, i32 0))
		br label %incr
	bzorprnt:
		br i1 %d5, label %bz, label %prnt
	bz:
		call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @buzz, i32 0, i32 0))
		br label %incr
	prnt:
		call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmtd, i32 0, i32 0), i32 %ival)
		br label %incr
	incr:
		%ival2 = add i32 %ival, 1
		store i32 %ival2, i32* %i

		%c = icmp ugt i32 %ival, 100
		br i1 %c, label %quit, label %loop
	quit:
		ret i32 0
}