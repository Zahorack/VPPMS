	.mmregs			;activate compilator use memory map registers 

	.bss tabulka, 9		;pamatove miesto
	.bss x, 1
	.bss y, 1

	.data
tab	.word	1, 2, 3, 4, 8, 6, 4, 2, 9		;konstatntna tabulka

	.text
start 	
	LAR AR0, #tab		;do AR0 zadame adresu tabulky konstant --> ADRESA PRVEHO PAMATOPVEHO MIESTA TAB
	LAR AR1, #tabulka	;do AR1 zadame adresu pamatoveho miesta
	LAR AR2, #8		;do AR2 zadame pocet prvkov ktore chceme zkopirovat

	MAR *,AR0

;ULOHA chceme zkopirovat tab do tabulka
loop	LACC *+, AR1			;nacitanie * [AR0] do akumulatora
;	MAR *, AR1  			netreba, lebo uz to je 
	SACL *+,AR2			;ulozime hodnotu z ACC do *, inkrementuje * [AR2]

	BANZ loop, *-,AR0		;branch until no zero, podmieneny skok ci je v AR0 hodnota 0, dekrementuje AR2, nastavenie aktovneho registra na AR0  


;ULOHA chceme setnut 3. bit v PMST
	LAMM PMST			;load to ACC from PMST register
	LDP #x				;load data page premenej x
	SACL x				;save ACC low to x

	OR #0100b			;setujeme 3. bit --> OR #4
	LDP #y
	SACL y				;ulozime novu hodnotu do y
	
	SAMM PMST			;prepiseme register PMST hodnotou v akumuilatore
	
	.sect	"vectors"	
	b start			;vrati PC na navastie start pri resete
	.end