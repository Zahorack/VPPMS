	.bss	x,4
	.bss	a,4
	.bss	y,1
	.data

tab .word	1,2,3,4,8,6,4,2,0
    .text
start	nop
	nop
	nop
	nop

	b start
	.sect "vectors"
	b start
	.end



