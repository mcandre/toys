"exec" "gst" "-f" "$0" "$0" "$@"

Character extend [
	rot13 [
		| cipherchar |

		cipherchar := self isLowercase ifTrue: [
			((((self asInteger - ($a asInteger)) + 13) \\ 26) + ($a asInteger)) asCharacter
		]
		ifFalse: [
			self isUppercase ifTrue: [
				((((self asInteger - ($A asInteger)) + 13) \\ 26) + ($A asInteger)) asCharacter
			]
			ifFalse: [
				self
			]
		].

		^cipherchar
	]
]

String extend [
	rot13 [
		| ciphertext |

		ciphertext := self collect: [ :c | c rot13 ].

		^ciphertext
	]
]

| main |

main := [
	[
		[ stdin atEnd ] whileFalse: [
			Transcript show: (stdin nextLine rot13); cr.
		]
	] on: ExUserBreak do: [].
].

(((Smalltalk getArgc) > 0) and: [ ((Smalltalk getArgv: 1) endsWith: 'rot13.st') ]) ifTrue: [
	main value.
].