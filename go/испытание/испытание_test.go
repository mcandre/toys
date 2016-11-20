package испытание_test

import (
	"testing"

	"github.com/mcandre/mcandre/go/испытание"
)

func TestИспытаниеReturnsИспытание(t *testing.T) {
	wanted := "Испытание!"
	observed := испытание.Испытание()

	if observed != wanted {
		t.Errorf("испытание.Испытание(): Wanted %s, got %s\n", wanted, observed)
	}
}
