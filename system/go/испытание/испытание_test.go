package испытание_test

import (
	"testing"

	"github.com/mcandre/toys/system/go/испытание"
)

func TestИспытаниеReturnsИспытание(t *testing.T) {
	wanted := испытание.Эксперимент{Строка: "Испытание!"}
	observed := испытание.Испытание()

	if observed != wanted {
		t.Errorf("испытание.Испытание(): Wanted %s, got %s\n", wanted, observed)
	}
}
