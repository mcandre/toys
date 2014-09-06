+ add one for major loop
[
	,+ read and add one (in case zero)

	[
		- subtract that one

		make a copy of first cell in second and third cells:

		[
			>+ put one in second cell
			>+ put one in third cell
			<<- subtract one from first cell
		] array: 0 copy1 copy2

		> go to second cell (first copy)

		[
			<+ back to first cell add one
			>- subtract one from second cell
		] array: original 0 copy

		+ add one to original

		>>++++++++ in fourth cell add eight

		[
			<-------- subtract eight from third cell
			>- subtract one from fourth cell
		] array: original 0 -64 0

		<- array: original 0 -65 0

		[
			< go to second cell

			[-] zap original (oh no!)

			>>>+ add one to forth cell

			array: 0 negative_64_original_minus_one 0 1

			[
				<+ add one to third cell
				<+ add one to second cell
				>>- subtract one from forth cell
			]

			<
			[>+<-]
			<

			[
				<++>>>+[<+<->>-]<[>+<-]
			]
			>[<]<
		]
		>>[-]<<<
		[
			[-]<[>>+>+<<<-]>>[<<+>>-]>>++++++++[<-------->-]<->>++++[<++++++++>-]<-<
			[
				>>>+<<
				[
					>+>[-]<<-
				]
				>[<+>-]>
			[
				<<<<<+>>>>++++[<++++++++>-]>-
			]
			<<-<-
		]
		>
		[
			<<<<[-]>>>>[<<<<->>>>-]
		]
		<<++++[<<++++++++>>-]<<-[>>+>+<<<-]>>[<<+>>-]+>>+++++[<----->-]<-
		[
			<[-]>>>+[<+<->>-]<[>+<-]<
			[
				<++>>>+[<+<+>>-]<[>+<-]
			]
			>[<]<
		]
		>>[-]<<<
		[
			[-]<<[>>+>+<<<-]>>[<<+>>-]+>------------
			[
				<[-]>>>+[<+<->>-]<[>+<-]<
				[
					<++>>>+[<+<+>>-]<[>+<-]
				]
				>[<]<]>>[-]<<<<<------------->>
				[
					[-]+++++[<<+++++>>-]<<+>>
				]
				<
				[
					>++++
					[<<++++++++>>-]<-
				]
				>
			]
			<[-]++++++++[<++++++++>-]<+>
		]
		<.[-]+>>+<
	]
	>
	[
		[-]<
	]
	<
]
