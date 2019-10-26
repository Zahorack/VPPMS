	.bss data, 4
	.bss pole, 4
	.bss vysledok, 1

	.data
tab	.word	1, 2, 3, 4, 8, 6, 4, 2, 0

	.text
start 	NOP
	NOP
	NOP
	NOP
	b start



	.sect	"vectors"
	b start
	.end