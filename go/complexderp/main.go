package main

import (
	"fmt"
	"math"
)

type Polar64 struct {
	r     float32
	theta float32
}

type Polar128 struct {
	r     float64
	theta float64
}

func Car2Pol64(z complex64) Polar64 {
	z2 := complex128(z)

	x := real(z2)
	y := imag(z2)

	r := math.Sqrt(x*x + y*y)
	theta := math.Atan(y / x)

	return Polar64{r: float32(r), theta: float32(theta)}
}

func Pol2Car64(z Polar64) complex64 {
	z2 := Polar128{r: float64(z.r), theta: float64(z.theta)}

	r := z2.r
	theta := z2.theta

	return complex(float32(r*math.Cos(theta)), float32(r*math.Sin(theta)))
}

func Car2Pol128(z complex128) Polar128 {
	x := real(z)
	y := imag(z)

	r := math.Sqrt(x*x + y*y)
	theta := math.Atan(y / x)

	return Polar128{r: r, theta: theta}
}

func Pol2Car128(z Polar128) complex128 {
	r := z.r
	theta := z.theta

	return complex(r*math.Cos(theta), r*math.Sin(theta))
}

func main() {
	zCartesian := 3 + 4i
	zPolar := Car2Pol128(zCartesian)

	fmt.Println("zCartesian =", zCartesian)
	fmt.Println("zPolar = Car2Pol128(zCartesian) =", zPolar)
	fmt.Println("Pol2Car128(Car2Pol128(zCartesian)) =", Pol2Car128(Car2Pol128(zCartesian)))
	fmt.Println("Car2Pol128(Pol2Car128(zPolar)) =", Car2Pol128(Pol2Car128(zPolar)))
}
