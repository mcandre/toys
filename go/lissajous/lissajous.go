package main

import (
	"image"
	"image/color"
	"image/gif"
	"io"
	"math"
	"math/rand"
	"os"
)

var palette = []color.Color{color.White, color.Black}

const (
	whiteIndex = 0
	blackIndex = 1
)

func main() {
	lissajous(os.Stdout)
}

func lissajous(out io.Writer) {
	const (
		cycles            = 5
		angularResolution = 0.01
		imageSize         = 100
		frames            = 64
		frameDelay        = 8 // units: 10ms
	)

	frequency := rand.Float64() * 3.0
	animation := gif.GIF{LoopCount: 0} // Loop forever
	phaseDifference := 0.0

	for i := 0; i < frames; i++ {
		rectangle := image.Rect(0, 0, 2*imageSize+1, 2*imageSize+1)

		image := image.NewPaletted(rectangle, palette)

		for t := 0.0; t < cycles*2*math.Pi; t += angularResolution {
			x := math.Sin(t)
			y := math.Sin(t*frequency + phaseDifference)

			image.SetColorIndex(imageSize+int(x*imageSize+0.5), imageSize+int(y*imageSize+0.5), blackIndex)
		}

		phaseDifference += 0.1

		animation.Delay = append(animation.Delay, frameDelay)
		animation.Image = append(animation.Image, image)
	}

	gif.EncodeAll(out, &animation)
}
