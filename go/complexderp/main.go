// Package main provides a complexderp executable demonstrating manipulation of complex numbers in Go.
package main

import (
	"fmt"
	"math"
)

// Polar64 is a 64-bit, polar representation of complex numbers.
type Polar64 struct {
	r     float32
	theta float32
}

// Polar128 is a 128-bit, polar representation of complex numbers.
type Polar128 struct {
	r     float64
	theta float64
}

// Car2Pol64 converts a given 64-bit complex number into polar representation.
func Car2Pol64(z complex64) Polar64 {
	z2 := complex128(z)

	x := real(z2)
	y := imag(z2)

	r := math.Sqrt(x*x + y*y)
	theta := math.Atan(y / x)

	return Polar64{r: float32(r), theta: float32(theta)}
}

// Pol2Car64 converts a given polar 64-bit complex number into rectangular representation.
func Pol2Car64(z Polar64) complex64 {
	z2 := Polar128{r: float64(z.r), theta: float64(z.theta)}

	r := z2.r
	theta := z2.theta

	return complex(float32(r*math.Cos(theta)), float32(r*math.Sin(theta)))
}

// Car2Pol128 converts a given 128-bit complex number into polar representation.
func Car2Pol128(z complex128) Polar128 {
	x := real(z)
	y := imag(z)

	r := math.Sqrt(x*x + y*y)
	theta := math.Atan(y / x)

	return Polar128{r: r, theta: theta}
}

// Pol2Car128 converts a given polar 128-bit complex number into rectangular representation.
func Pol2Car128(z Polar128) complex128 {
	r := z.r
	theta := z.theta

	return complex(r*math.Cos(theta), r*math.Sin(theta))
}

// main is the entrypoint for this application.
func main() {
	zCartesian := 3 + 4i
	zPolar := Car2Pol128(zCartesian)

	fmt.Println("zCartesian =", zCartesian)
	fmt.Println("zPolar = Car2Pol128(zCartesian) =", zPolar)
	fmt.Println("Pol2Car128(Car2Pol128(zCartesian)) =", Pol2Car128(Car2Pol128(zCartesian)))
	fmt.Println("Car2Pol128(Pol2Car128(zPolar)) =", Car2Pol128(Pol2Car128(zPolar)))
}
