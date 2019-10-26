;DATOVA PAMAT
	.bss data, 4
	.bss koef, 4
	.bss vysl, 2

;PROGRAMOVA PAMAT
	.data
tab	.word	1, 2, 3, 4, 8, 6, 4, 2		;konstatntna tabulka

	.text
start 	

;ULOHA chceme zkopirovat prve 4 z tab do data
	LAR AR0, #tab		;do AR0 zadame adresu tabulky konstant --> ADRESA PRVEHO PAMATOPVEHO MIESTA TAB
	LAR AR1, #data	;do AR1 zadame adresu pamatoveho miesta
	LAR AR2, #3		;do AR2 zadame pocet prvkov ktore chceme zkopirovat
	MAR *,AR0		;make acitive register ARO, (cez referenciu *)


loop	LACC *+, AR1			;nacitanie * [AR0] do akumulatora
;	MAR *, AR1  			netreba, lebo uz to je 
	SACL *+,AR2			;ulozime hodnotu z ACC do *, inkrementuje * [AR2]

	BANZ loop, *-,AR0		;branch until no zero, podmieneny skok ci je v AR0 hodnota 0, dekrementuje AR2, nastavenie aktovneho registra na AR0  


;ULOHA chceme zkopirovat posledne 4 z tab dokoef
	LAR AR0, #tab+4		;do AR0 zadame adresu tabulky konstant --> ADRESA PRVEHO PAMATOPVEHO MIESTA TAB
	LAR AR1, #koef		;do AR1 zadame adresu pamatoveho miesta
	LAR AR2, #3		;do AR2 zadame pocet prvkov ktore chceme zkopirovat
	MAR *,AR0		;make acitive register ARO (cez referenciu *)

slucka	LACC *+, AR1			;nacitanie * [AR0] do akumulatora
;	MAR *, AR1  			netreba, lebo uz to je 
	SACL *+,AR2			;ulozime hodnotu z ACC do *, inkrementuje * [AR2]

	BANZ slucka, *-,AR0		;branch until no zero, podmieneny skok ci je v AR0 hodnota 0, dekrementuje AR2, nastavenie aktovneho registra na AR0  



	LAR AR0, #koef
	LAR AR1, #data
	LAR AR2, #vysl
;ULOHA chceme vynasobit data[i] s koef[i] pomaly sposob
;	LT *+,AR1		;load to temporary register, set astcive register AR1, increment 
;	MPY *+,AR0
;	PAC			;product to accumulator
;	LT *+,AR1		;load to temporary register
;	MPY *+,AR0	
;	APAC			;ADD product to ACC
;	LT *+,AR1		;load to temporary register
;	MPY *+,AR0	
;	APAC
;	LT *+,AR1		;load to temporary register
;	MPY *,AR2
;	APAC
;	SACH *+			;ulozenie do vysledku high 16 bits
;	SACL *			;ulozenie do vysledku low 16 bits
	
;ULOHA chceme vynasobit data[i] s koef[i] rychlejsi sposob pomocou LTP
	LT *+,AR1
	MPY *+,AR0
	LTP *+,AR1		;LTP = LT + PAC
	MPY *+,AR0
	LTA *+,AR1		;LTA = LT + APAC
	MPY *+,AR0
	LTA *+,AR1
	MPY *+,AR0
	APAC
	MAR *,AR2


	SACH *+
	SACL *

;ULOHA chceme vynasobit data[i] s koef[i] najrychlejsi sposob pomocou MAC
	RPT #4
	MAC data+, koef+


	.sect	"vectors"	
	b start			;vrati PC na navastie start pri resete
	.end