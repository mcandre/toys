// ASCII2MORSE encodes ASCII characters.
// https://en.wikipedia.org/wiki/Morse_code
const char ASCII2MORSE[128][8] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    " ",
    "-.-.--",
    ".-..-.",
    "",
    "...-..-",
    ".-...",
    "",
    ".----.",
    "-.--.",
    "-.--.-",
    "",
    ".-.-.",
    "--..--",
    "-....-",
    ".-.-.- ",
    "-..-.",
    "-----",
    ".----",
    "..---",
    "...--",
    "....-",
    ".....",
    "-....",
    "--...",
    "---..",
    "----.",
    "---...",
    "-.-.-.",
    "",
    "-...-",
    "",
    "..--..",
    ".--.-.",
    ".-",
    "-...",
    "-.-.",
    "-..",
    ".",
    "..-.",
    "--.",
    "....",
    "..",
    ".---",
    "-.-",
    ".-..",
    "--",
    "-.",
    "---",
    ".--.",
    "--.-",
    ".-.",
    "...",
    "-",
    "..-",
    "...-",
    ".--",
    "-..-",
    "-.--",
    "--..",
    "",
    "",
    "",
    "",
    "..--.-",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
};

// setup initializes.
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
}

// flash_dd emits a dih or dah.
void flash_dd(int pin, char dd, int scale_ms) {
    int v = dd - '-';

    if (v >= 0) {
        v = 1 - v;

        digitalWrite(pin, HIGH);
        delay(scale_ms + 3 * scale_ms * v);
        digitalWrite(pin, LOW);
    }

    delay(scale_ms);
}

// flash_char emits an ASCII character.
void flash_char(char ascii, int scale_ms) {
    char* morse = ASCII2MORSE[ascii];
    size_t morse_len = strlen(morse);

    for (size_t i = 0; i < morse_len; i++) {
        char m = morse[i];
        flash_dd(LED_BUILTIN, m, scale_ms);
    }

    delay(scale_ms);
}

// flash_morse emits an ASCII string.
void flash_morse(char* ascii, int scale_ms) {
    size_t ascii_len = strlen(ascii);
    for (size_t i = 0; i < ascii_len; i++) {
        flash_char(toupper(ascii[i]), scale_ms);
    }
}

// loop repeats.
void loop() {
    flash_morse("Hello World", 300);
}
