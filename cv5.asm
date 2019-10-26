;DATOVA PAMAT
	.bss data, 4
	.bss vysl, 2

;PROGRAMOVA PAMAT
	.data
sample	.word	1, 2, 3, 4
koef	.word	8, 6, 4, 2

	.text
start 	

;ULOHA chceme zkopirovat sample do data
	LAR AR0, #data
	MAR *,AR0

	RPT #3				;opakuje nasledujucu instrukciu N+1 krat
	BLPD #sample, *+		;blokovy presun dat z PROG mem do DATA mem 		


;ULOHA chceme nasobit date[i] s koef[i] s prikazom MAC
	LAR AR0, #data
	
	RPTZ #3			;repeat until zero
	MAC #koef, *+		MAC <PROG mem> <DATA mem> //MAC = APAC + LT +MPY
	APAC

	LAR AR1, #vysl
	MAR *,AR1
	SACH *+
	SACL *
	
	.sect	"vectors"	
	b start			;vrati PC na navastie start pri resete
	.end