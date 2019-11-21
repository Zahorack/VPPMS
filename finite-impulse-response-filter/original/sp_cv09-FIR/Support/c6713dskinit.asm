;******************************************************************************
;* TMS320C6x C/C++ Codegen                                    PC Version 4.36 *
;* Date/Time created: Tue May 10 15:03:37 2011                                *
;******************************************************************************

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C671x                                          *
;*   Optimization      : Enabled at level 1                                   *
;*   Optimizing for    : Compile time 1st, speed 2nd                          *
;*                       Based on options: -o1, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Memory Model      : Small                                                *
;*   Calls to RTS      : Near                                                 *
;*   Pipelining        : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : COFF Debug                                           *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss

	.file	"c6713dskinit.c"
	.global	_AIC_data
	.bss	_AIC_data,4,4
	.sym	_AIC_data,_AIC_data, 9, 2, 32, $$fake2
	.bss	_CODECEventId,4,4
	.sym	_CODECEventId,_CODECEventId, 14, 3, 32
	.bss	_poll,4,4
	.sym	_poll,_poll, 14, 3, 32

	.sect	".cinit"
	.align	8
	.field  	IR_1,32
	.field  	_AIC23CfgData+0,32
	.field  	0,32			; _AIC23CfgData._spcr @ 0
	.field  	160,32			; _AIC23CfgData._rcr @ 32
	.field  	160,32			; _AIC23CfgData._xcr @ 64
	.field  	536870913,32			; _AIC23CfgData._srgr @ 96
	.field  	0,32			; _AIC23CfgData._mcr @ 128
	.field  	0,32			; _AIC23CfgData._rcer @ 160
	.field  	0,32			; _AIC23CfgData._xcer @ 192
	.field  	3,32			; _AIC23CfgData._pcr @ 224
IR_1:	.set	32

	.sect	".text"
	.global	_AIC23CfgData
	.bss	_AIC23CfgData,32,4
	.sym	_AIC23CfgData,_AIC23CfgData, 8, 2, 256, $$fake1

	.sect	".cinit"
	.align	8
	.field  	IR_2,32
	.field  	_config+0,32
	.field  	23,32			; _config._regs[0] @ 0
	.field  	23,32			; _config._regs[1] @ 32
	.field  	505,32			; _config._regs[2] @ 64
	.field  	505,32			; _config._regs[3] @ 96
	.field  	17,32			; _config._regs[4] @ 128
	.field  	0,32			; _config._regs[5] @ 160
	.field  	0,32			; _config._regs[6] @ 192
	.field  	67,32			; _config._regs[7] @ 224
	.field  	129,32			; _config._regs[8] @ 256
	.field  	1,32			; _config._regs[9] @ 288
IR_2:	.set	40

	.sect	".text"
	.global	_config
	.bss	_config,40,4
	.sym	_config,_config, 8, 2, 320, _DSK6713_AIC23_Config
	.global	_hAIC23_handle
	.bss	_hAIC23_handle,4,4
	.sym	_hAIC23_handle,_hAIC23_handle, 4, 2, 32
;	c:\ti\c6000\cgtools\bin\opt6x.exe -v6710 -q -s -O1 C:\DOCUME~1\student\LOCALS~1\Temp\TI1580_2 C:\DOCUME~1\student\LOCALS~1\Temp\TI1580_5 -w C:/ti/workspace/FFT/Debug 

	.sect	".text"
	.global	_c6713_dsk_init
	.sym	_c6713_dsk_init,_c6713_dsk_init, 32, 2, 0
	.func	7

;******************************************************************************
;* FUNCTION NAME: _c6713_dsk_init                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,SP                                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,DP,SP                               *
;*   Local Frame Size  : 0 Args + 0 Auto + 8 Save = 8 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_c6713_dsk_init:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	C$1,21, 24, 4, 32, $$fake0
	.sym	Y$0,4, 4, 4, 32
	.sym	_gie,26, 14, 4, 32
	.sym	_base,20, 30, 4, 32
	.sym	_x0,19, 4, 4, 32
	.sym	_x2,22, 4, 4, 32
	.sym	_x3,23, 4, 4, 32
	.sym	_x4,24, 4, 4, 32
	.sym	_x5,25, 4, 4, 32
	.sym	_x6,16, 4, 4, 32
	.sym	_x7,17, 4, 4, 32
;** 9	-----------------------    DSK6713_init();
;** 11	-----------------------    hAIC23_handle = Y$0 = DSK6713_AIC23_openCodec(0, &config);
;** 12	-----------------------    DSK6713_AIC23_setFreq(Y$0, fs);
;** 280	-----------------------    C$1 = DSK6713_AIC23_codecdatahandle;  // [14]
;** 280	-----------------------    base = C$1->baseAddr;  // [14]
;** 273	-----------------------    gie = CSR&1u;  // [3]
;** 274	-----------------------    CSR = CSR&0xfffffffeu;  // [3]
;** 287	-----------------------    x0 = AIC23CfgData.spcr;  // [14]
;** 289	-----------------------    x2 = AIC23CfgData.xcr;  // [14]
;** 290	-----------------------    x3 = AIC23CfgData.srgr;  // [14]
;** 291	-----------------------    x4 = AIC23CfgData.mcr;  // [14]
;** 292	-----------------------    x5 = AIC23CfgData.rcer;  // [14]
;** 293	-----------------------    x6 = AIC23CfgData.xcer;  // [14]
;** 294	-----------------------    x7 = AIC23CfgData.pcr;  // [14]
;** 297	-----------------------    base[3] = AIC23CfgData.rcr;  // [14]
;** 298	-----------------------    base[4] = x2;  // [14]
;** 299	-----------------------    base[5] = x3;  // [14]
;** 300	-----------------------    base[6] = x4;  // [14]
;** 301	-----------------------    base[7] = x5;  // [14]
;** 302	-----------------------    base[8] = x6;  // [14]
;** 303	-----------------------    base[9] = x7;  // [14]
;** 304	-----------------------    base[2] = x0;  // [14]
;** 279	-----------------------    CSR = CSR&0xfffffffeu|gie&1u;  // [4]
;** 15	-----------------------    MCBSP_start(C$1, 15u, 220u);
;** 15	-----------------------    return;
           STW     .D2T2   B10,*SP--(8)      ; |8| 
           STW     .D2T2   B3,*+SP(4)        ; |8| 
	.line	3
           CALL    .S1     _DSK6713_init     ; |9| 
           MVKL    .S2     RL0,B3            ; |9| 
           MVKH    .S2     RL0,B3            ; |9| 
           NOP             3
RL0:       ; CALL OCCURS                     ; |9| 
	.line	5
           CALL    .S1     _DSK6713_AIC23_openCodec ; |11| 
           MVK     .S2     (_config-$bss),B4 ; |11| 
           MVKL    .S2     RL1,B3            ; |11| 
           ADD     .D2     DP,B4,B4          ; |11| 
           MVKH    .S2     RL1,B3            ; |11| 
           ZERO    .D1     A4                ; |11| 
RL1:       ; CALL OCCURS                     ; |11| 
           STW     .D2T1   A4,*+DP(_hAIC23_handle) ; |11| 
	.line	6
           CALL    .S1     _DSK6713_AIC23_setFreq ; |12| 
           LDW     .D2T2   *+DP(_fs),B4      ; |12| 
           MVKL    .S2     RL2,B3            ; |12| 
           NOP             2
           MVKH    .S2     RL2,B3            ; |12| 
RL2:       ; CALL OCCURS                     ; |12| 
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B5 ; |280| 
           NOP             4
           LDW     .D2T2   *+B5(12),B4       ; |280| 
           MVC     .S2     CSR,B6            ; |273| 
           AND     .S2     1,B6,B10          ; |273| 
           MVC     .S2     CSR,B6            ; |274| 
           AND     .S2     -2,B6,B6          ; |274| 
           MVC     .S2     B6,CSR            ; |274| 
           LDW     .D2T2   *+DP(_AIC23CfgData),B3 ; |287| 
           LDW     .D2T2   *+DP(_AIC23CfgData+8),B6 ; |289| 
           LDW     .D2T2   *+DP(_AIC23CfgData+12),B7 ; |290| 
           LDW     .D2T2   *+DP(_AIC23CfgData+16),B8 ; |291| 
           LDW     .D2T2   *+DP(_AIC23CfgData+20),B9 ; |292| 
           LDW     .D2T2   *+DP(_AIC23CfgData+24),B0 ; |293| 
           LDW     .D2T2   *+DP(_AIC23CfgData+28),B1 ; |294| 
           LDW     .D2T2   *+DP(_AIC23CfgData+4),B2 ; |297| 
           NOP             4
           STW     .D2T2   B2,*+B4(12)       ; |297| 
           STW     .D2T2   B6,*+B4(16)       ; |298| 
           STW     .D2T2   B7,*+B4(20)       ; |299| 
           STW     .D2T2   B8,*+B4(24)       ; |300| 
           STW     .D2T2   B9,*+B4(28)       ; |301| 
           STW     .D2T2   B0,*+B4(32)       ; |302| 
           STW     .D2T2   B1,*+B4(36)       ; |303| 
           STW     .D2T2   B3,*+B4(8)        ; |304| 
           MVC     .S2     CSR,B4            ; |279| 

           AND     .S2     1,B10,B4          ; |279| 
||         AND     .L2     -2,B4,B6          ; |279| 

           OR      .S2     B4,B6,B4          ; |279| 
           MVC     .S2     B4,CSR            ; |279| 
	.line	9
           MVKL    .S1     _MCBSP_start,A0   ; |15| 
           MVKH    .S1     _MCBSP_start,A0   ; |15| 
           CALL    .S2X    A0                ; |15| 
           MVKL    .S2     RL3,B3            ; |15| 
           MVKH    .S2     RL3,B3            ; |15| 
           MVK     .S1     0xdc,A6           ; |15| 
           MVK     .S2     0xf,B4            ; |15| 
           MV      .L1X    B5,A4             ; |15| 
RL3:       ; CALL OCCURS                     ; |15| 
	.line	11
           LDW     .D2T2   *+SP(4),B3        ; |17| 
           LDW     .D2T2   *++SP(8),B10      ; |17| 
           NOP             3
           RET     .S2     B3                ; |17| 
           NOP             5
           ; BRANCH OCCURS                   ; |17| 
	.endfunc	17,004080000h,8



	.sect	".text"
	.global	_comm_poll
	.sym	_comm_poll,_comm_poll, 32, 2, 0
	.func	19

;******************************************************************************
;* FUNCTION NAME: _comm_poll                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP                                   *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_comm_poll:
;** --------------------------------------------------------------------------*
	.line	2
;** 21	-----------------------    poll = 1u;
;** 22	-----------------------    c6713_dsk_init();
;** 22	-----------------------    return;
           STW     .D2T2   B3,*SP--(8)       ; |20| 
	.line	3
           MVK     .S1     1,A0              ; |21| 
           STW     .D2T1   A0,*+DP(_poll)    ; |21| 
	.line	4
           CALL    .S1     _c6713_dsk_init   ; |22| 
           MVKL    .S2     RL4,B3            ; |22| 
           MVKH    .S2     RL4,B3            ; |22| 
           NOP             3
RL4:       ; CALL OCCURS                     ; |22| 
	.line	5
           LDW     .D2T2   *++SP(8),B3       ; |23| 
           NOP             4
           RET     .S2     B3                ; |23| 
           NOP             5
           ; BRANCH OCCURS                   ; |23| 
	.endfunc	23,000080000h,8



	.sect	".text"
	.global	_comm_intr
	.sym	_comm_intr,_comm_intr, 32, 2, 0
	.func	25

;******************************************************************************
;* FUNCTION NAME: _comm_intr                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,DP,SP                                   *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_comm_intr:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	C$1,20, 14, 4, 32
	.sym	Y$0,21, 14, 4, 32
;** 27	-----------------------    poll = 0u;
;** 273	-----------------------    CSR;  // [3]
;** 274	-----------------------    CSR = CSR&0xfffffffeu;  // [3]
;** 29	-----------------------    c6713_dsk_init();
;** 221	-----------------------    CODECEventId = Y$0 = DSK6713_AIC23_codecdatahandle->xmtEventId;  // [9]
;** 36	-----------------------    IRQ_map(Y$0, 11u);
;** 283	-----------------------    C$1 = _IRQ_eventTable[CODECEventId];  // [5]
;** 283	-----------------------    IER &= ~C$1;  // [5]
;** 284	-----------------------    ICR = C$1;  // [5]
;** 269	-----------------------    CSR = CSR|1u;  // [2]
;** 294	-----------------------    IER |= 2u;  // [6]
;** 239	-----------------------    IER |= C$1;  // [1]
;** 42	-----------------------    output_sample(0);
;** 42	-----------------------    return;
           STW     .D2T2   B3,*SP--(8)       ; |26| 
	.line	3
           ZERO    .D2     B4                ; |27| 
           STW     .D2T2   B4,*+DP(_poll)    ; |27| 
           MVC     .S2     CSR,B4            ; |274| 
           AND     .S2     -2,B4,B4          ; |274| 
           MVC     .S2     B4,CSR            ; |274| 
	.line	5
           CALL    .S1     _c6713_dsk_init   ; |29| 
           MVKL    .S2     RL5,B3            ; |29| 
           MVKH    .S2     RL5,B3            ; |29| 
           NOP             3
RL5:       ; CALL OCCURS                     ; |29| 
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |221| 
           NOP             4
           LDW     .D2T2   *+B4(4),B5        ; |221| 
           NOP             4
           STW     .D2T2   B5,*+DP(_CODECEventId) ; |221| 
	.line	12
           MVKL    .S1     _IRQ_map,A0       ; |36| 
           MVKH    .S1     _IRQ_map,A0       ; |36| 
           CALL    .S2X    A0                ; |36| 
           MVKL    .S2     RL6,B3            ; |36| 
           MVKH    .S2     RL6,B3            ; |36| 
           MVK     .S2     0xb,B4            ; |36| 
           MV      .S1X    B5,A4             ; |36| 
           NOP             1
RL6:       ; CALL OCCURS                     ; |36| 
           LDW     .D2T2   *+DP(_CODECEventId),B5 ; |283| 
           MVKL    .S2     __IRQ_eventTable,B4 ; |283| 
           MVKH    .S2     __IRQ_eventTable,B4 ; |283| 
           NOP             2
           LDW     .D2T2   *+B4[B5],B4       ; |283| 
           NOP             3
           MVC     .S2     IER,B6            ; |283| 
           NOT     .S2     B4,B5             ; |283| 
           AND     .S2     B5,B6,B5          ; |283| 
           MVC     .S2     B5,IER            ; |283| 
           MVC     .S2     B4,ICR            ; |284| 
           MVC     .S2     CSR,B5            ; |269| 
           OR      .S2     1,B5,B5           ; |269| 
           MVC     .S2     B5,CSR            ; |269| 
           MVC     .S2     IER,B5            ; |294| 
           OR      .S2     2,B5,B5           ; |294| 
           MVC     .S2     B5,IER            ; |294| 
           MVC     .S2     IER,B5            ; |239| 
           OR      .S2     B4,B5,B4          ; |239| 
           MVC     .S2     B4,IER            ; |239| 
	.line	18
           CALL    .S1     _output_sample    ; |42| 
           MVKL    .S2     RL7,B3            ; |42| 
           MVKH    .S2     RL7,B3            ; |42| 
           ZERO    .D1     A4                ; |42| 
           NOP             2
RL7:       ; CALL OCCURS                     ; |42| 
	.line	19
           LDW     .D2T2   *++SP(8),B3       ; |43| 
           NOP             4
           RET     .S2     B3                ; |43| 
           NOP             5
           ; BRANCH OCCURS                   ; |43| 
	.endfunc	43,000080000h,8



	.sect	".text"
	.global	_output_sample
	.sym	_output_sample,_output_sample, 32, 2, 0
	.func	45

;******************************************************************************
;* FUNCTION NAME: _output_sample                                              *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5,B6,B7                                       *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,B7,DP                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_output_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	_out_data,4, 4, 17, 32
	.sym	C$1,21, 19, 4, 32
	.sym	C$2,20, 19, 4, 32
	.sym	_CHANNEL_data,23, 3, 4, 16
	.sym	_out_data,4, 4, 4, 32
;** 50	-----------------------    AIC_data.uint = out_data;
;** 55	-----------------------    C$2 = &AIC_data.channel[0];
;** 55	-----------------------    CHANNEL_data = *C$2;
;** 56	-----------------------    C$1 = &C$2[1];
;** 56	-----------------------    *C$2 = *C$1;
;** 57	-----------------------    *C$1 = CHANNEL_data;
;** 58	-----------------------    if ( !poll ) goto g4;
	.line	6
           STW     .D2T1   A4,*+DP(_AIC_data) ; |50| 
	.line	11
           MVK     .S2     (_AIC_data-$bss),B4 ; |55| 
           ADD     .D2     DP,B4,B4          ; |55| 
           LDH     .D2T2   *B4,B7            ; |55| 
	.line	12
           ADD     .D2     2,B4,B5           ; |56| 
           LDH     .D2T2   *B5,B6            ; |56| 
           NOP             4
           STH     .D2T2   B6,*B4            ; |56| 
	.line	13
           STH     .D2T2   B7,*B5            ; |57| 
	.line	14
           LDW     .D2T2   *+DP(_poll),B0    ; |58| 
           NOP             4
   [!B0]   B       .S1     L2                ; |58| 
           NOP             5
           ; BRANCH OCCURS                   ; |58| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
;**	-----------------------g3:
;** 237	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&0x20000u) ) goto g3;  // [12]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |237| 
           NOP             4
           EXTU    .S2     B4,14,31,B0       ; |237| 
   [!B0]   B       .S1     L1                ; |237| 
           NOP             5
           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
L2:    
;**	-----------------------g4:
;** 233	-----------------------    *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->dxrAddr = AIC_data.uint;  // [11]
;** 59	-----------------------    return;
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |233| 
           LDW     .D2T2   *+DP(_AIC_data),B5 ; |233| 
           NOP             3
           LDW     .D2T2   *+B4(20),B4       ; |233| 
           NOP             4
           STW     .D2T2   B5,*B4            ; |233| 
	.line	15
	.line	16
           RET     .S2     B3                ; |60| 
           NOP             5
           ; BRANCH OCCURS                   ; |60| 
	.endfunc	60,000000000h,0



	.sect	".text"
	.global	_output_left_sample
	.sym	_output_left_sample,_output_left_sample, 32, 2, 0
	.func	62

;******************************************************************************
;* FUNCTION NAME: _output_left_sample                                         *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5                                             *
;*   Regs Used         : A4,B0,B3,B4,B5,DP                                    *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_output_left_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	_out_data,4, 3, 17, 16
	.sym	_out_data,4, 3, 4, 16
;** 64	-----------------------    AIC_data.uint = 0u;
;** 65	-----------------------    AIC_data.channel[1] = out_data;
;** 67	-----------------------    if ( !poll ) goto g4;
	.line	3
           ZERO    .D2     B4                ; |64| 
           STW     .D2T2   B4,*+DP(_AIC_data) ; |64| 
	.line	4
           STH     .D2T1   A4,*+DP(_AIC_data+2) ; |65| 
	.line	6
           LDW     .D2T2   *+DP(_poll),B0    ; |67| 
           NOP             4
   [!B0]   B       .S1     L4                ; |67| 
           NOP             5
           ; BRANCH OCCURS                   ; |67| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
;**	-----------------------g3:
;** 237	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&0x20000u) ) goto g3;  // [12]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |237| 
           NOP             4
           EXTU    .S2     B4,14,31,B0       ; |237| 
   [!B0]   B       .S1     L3                ; |237| 
           NOP             5
           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
L4:    
;**	-----------------------g4:
;** 233	-----------------------    *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->dxrAddr = AIC_data.uint;  // [11]
;** 68	-----------------------    return;
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |233| 
           LDW     .D2T2   *+DP(_AIC_data),B5 ; |233| 
           NOP             3
           LDW     .D2T2   *+B4(20),B4       ; |233| 
           NOP             4
           STW     .D2T2   B5,*B4            ; |233| 
	.line	7
	.line	8
           RET     .S2     B3                ; |69| 
           NOP             5
           ; BRANCH OCCURS                   ; |69| 
	.endfunc	69,000000000h,0



	.sect	".text"
	.global	_output_right_sample
	.sym	_output_right_sample,_output_right_sample, 32, 2, 0
	.func	71

;******************************************************************************
;* FUNCTION NAME: _output_right_sample                                        *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5                                             *
;*   Regs Used         : A4,B0,B3,B4,B5,DP                                    *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_output_right_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	_out_data,4, 3, 17, 16
	.sym	_out_data,4, 3, 4, 16
;** 73	-----------------------    AIC_data.uint = 0u;
;** 74	-----------------------    AIC_data.channel[0] = out_data;
;** 76	-----------------------    if ( !poll ) goto g4;
	.line	3
           ZERO    .D2     B4                ; |73| 
           STW     .D2T2   B4,*+DP(_AIC_data) ; |73| 
	.line	4
           STH     .D2T1   A4,*+DP(_AIC_data) ; |74| 
	.line	6
           LDW     .D2T2   *+DP(_poll),B0    ; |76| 
           NOP             4
   [!B0]   B       .S1     L6                ; |76| 
           NOP             5
           ; BRANCH OCCURS                   ; |76| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
;**	-----------------------g3:
;** 237	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&0x20000u) ) goto g3;  // [12]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |237| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |237| 
           NOP             4
           EXTU    .S2     B4,14,31,B0       ; |237| 
   [!B0]   B       .S1     L5                ; |237| 
           NOP             5
           ; BRANCH OCCURS                   ; |237| 
;** --------------------------------------------------------------------------*
L6:    
;**	-----------------------g4:
;** 233	-----------------------    *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->dxrAddr = AIC_data.uint;  // [11]
;** 77	-----------------------    return;
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |233| 
           LDW     .D2T2   *+DP(_AIC_data),B5 ; |233| 
           NOP             3
           LDW     .D2T2   *+B4(20),B4       ; |233| 
           NOP             4
           STW     .D2T2   B5,*B4            ; |233| 
	.line	7
	.line	8
           RET     .S2     B3                ; |78| 
           NOP             5
           ; BRANCH OCCURS                   ; |78| 
	.endfunc	78,000000000h,0



	.sect	".text"
	.global	_input_sample
	.sym	_input_sample,_input_sample, 46, 2, 0
	.func	80

;******************************************************************************
;* FUNCTION NAME: _input_sample                                               *
;*                                                                            *
;*   Regs Modified     : A4,B0,B4,B5,B6,B7                                    *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,B7,DP                              *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_input_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	C$2,21, 19, 4, 32
	.sym	C$3,20, 19, 4, 32
	.sym	_CHANNEL_data,23, 3, 4, 16
	.sym	R$1,20, 14, 4, 32
;** 84	-----------------------    if ( !poll ) goto g4;
	.line	5
           LDW     .D2T2   *+DP(_poll),B0    ; |84| 
           NOP             4
   [!B0]   B       .S1     L8                ; |84| 
           NOP             5
           ; BRANCH OCCURS                   ; |84| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
;**	-----------------------g3:
;** 241	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&2u) ) goto g3;  // [13]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |241| 
           NOP             4
           AND     .S2     2,B4,B0           ; |241| 
   [!B0]   B       .S1     L7                ; |241| 
           NOP             5
           ; BRANCH OCCURS                   ; |241| 
;** --------------------------------------------------------------------------*
L8:    
;**	-----------------------g4:
;** 229	-----------------------    R$1 = *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->drrAddr;  // [10]
;** 229	-----------------------    AIC_data.uint = R$1;  // [10]
;** 88	-----------------------    C$3 = &AIC_data.channel[0];
;** 88	-----------------------    CHANNEL_data = *C$3;
;** 89	-----------------------    C$2 = &C$3[1];
;** 89	-----------------------    *C$3 = *C$2;
;** 90	-----------------------    *C$2 = CHANNEL_data;
;** 92	-----------------------    return AIC_data.uint;
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |229| 
           NOP             4
           LDW     .D2T2   *+B4(16),B4       ; |229| 
           NOP             4
           LDW     .D2T2   *B4,B4            ; |229| 
           NOP             4
           STW     .D2T2   B4,*+DP(_AIC_data) ; |229| 
	.line	9
           MVK     .S2     (_AIC_data-$bss),B4 ; |88| 
           ADD     .D2     DP,B4,B4          ; |88| 
           LDH     .D2T2   *B4,B7            ; |88| 
	.line	10
           ADD     .D2     2,B4,B5           ; |89| 
           LDH     .D2T2   *B5,B6            ; |89| 
           NOP             4
           STH     .D2T2   B6,*B4            ; |89| 
	.line	11
           STH     .D2T2   B7,*B5            ; |90| 
	.line	13
           LDW     .D2T1   *+DP(_AIC_data),A4 ; |92| 
	.line	14
           RET     .S2     B3                ; |93| 
           NOP             5
           ; BRANCH OCCURS                   ; |93| 
	.endfunc	93,000000000h,0



	.sect	".text"
	.global	_input_left_sample
	.sym	_input_left_sample,_input_left_sample, 35, 2, 0
	.func	95

;******************************************************************************
;* FUNCTION NAME: _input_left_sample                                          *
;*                                                                            *
;*   Regs Modified     : A4,B0,B4                                             *
;*   Regs Used         : A4,B0,B3,B4,DP                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_input_left_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	R$1,20, 14, 4, 32
;** 97	-----------------------    if ( !poll ) goto g4;
	.line	3
           LDW     .D2T2   *+DP(_poll),B0    ; |97| 
           NOP             4
   [!B0]   B       .S1     L10               ; |97| 
           NOP             5
           ; BRANCH OCCURS                   ; |97| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L9:    
;**	-----------------------g3:
;** 241	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&2u) ) goto g3;  // [13]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |241| 
           NOP             4
           AND     .S2     2,B4,B0           ; |241| 
   [!B0]   B       .S1     L9                ; |241| 
           NOP             5
           ; BRANCH OCCURS                   ; |241| 
;** --------------------------------------------------------------------------*
L10:    
;**	-----------------------g4:
;** 229	-----------------------    R$1 = *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->drrAddr;  // [10]
;** 229	-----------------------    AIC_data.uint = R$1;  // [10]
;** 99	-----------------------    return AIC_data.channel[1];
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |229| 
           NOP             4
           LDW     .D2T2   *+B4(16),B4       ; |229| 
           NOP             4
           LDW     .D2T2   *B4,B4            ; |229| 
           NOP             4
           STW     .D2T2   B4,*+DP(_AIC_data) ; |229| 
	.line	5
           LDH     .D2T1   *+DP(_AIC_data+2),A4 ; |99| 
	.line	6
           RET     .S2     B3                ; |100| 
           NOP             5
           ; BRANCH OCCURS                   ; |100| 
	.endfunc	100,000000000h,0



	.sect	".text"
	.global	_input_right_sample
	.sym	_input_right_sample,_input_right_sample, 35, 2, 0
	.func	102

;******************************************************************************
;* FUNCTION NAME: _input_right_sample                                         *
;*                                                                            *
;*   Regs Modified     : A4,B0,B4                                             *
;*   Regs Used         : A4,B0,B3,B4,DP                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o1) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
_input_right_sample:
;** --------------------------------------------------------------------------*
	.line	2
	.sym	R$1,20, 14, 4, 32
;** 104	-----------------------    if ( !poll ) goto g4;
	.line	3
           LDW     .D2T2   *+DP(_poll),B0    ; |104| 
           NOP             4
   [!B0]   B       .S1     L12               ; |104| 
           NOP             5
           ; BRANCH OCCURS                   ; |104| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Software pipelining disabled
;*----------------------------------------------------------------------------*
L11:    
;**	-----------------------g3:
;** 241	-----------------------    if ( !(*(volatile unsigned *)(unsigned)(DSK6713_AIC23_codecdatahandle->baseAddr+8)&2u) ) goto g3;  // [13]
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(12),B4       ; |241| 
           NOP             4
           LDW     .D2T2   *+B4(8),B4        ; |241| 
           NOP             4
           AND     .S2     2,B4,B0           ; |241| 
   [!B0]   B       .S1     L11               ; |241| 
           NOP             5
           ; BRANCH OCCURS                   ; |241| 
;** --------------------------------------------------------------------------*
L12:    
;**	-----------------------g4:
;** 229	-----------------------    R$1 = *(volatile unsigned *)DSK6713_AIC23_codecdatahandle->drrAddr;  // [10]
;** 229	-----------------------    AIC_data.uint = R$1;  // [10]
;** 106	-----------------------    return AIC_data.channel[0];
           LDW     .D2T2   *+DP(_DSK6713_AIC23_codecdatahandle),B4 ; |229| 
           NOP             4
           LDW     .D2T2   *+B4(16),B4       ; |229| 
           NOP             4
           LDW     .D2T2   *B4,B4            ; |229| 
           NOP             4
           STW     .D2T2   B4,*+DP(_AIC_data) ; |229| 
	.line	5
           LDH     .D2T1   *+DP(_AIC_data),A4 ; |106| 
	.line	6
           RET     .S2     B3                ; |107| 
           NOP             5
           ; BRANCH OCCURS                   ; |107| 
	.endfunc	107,000000000h,0


;; Inlined function references:
;; [  1] IRQ_enable
;; [  2] IRQ_globalEnable
;; [  3] IRQ_globalDisable
;; [  4] IRQ_globalRestore
;; [  5] IRQ_reset
;; [  6] IRQ_nmiEnable
;; [  9] MCBSP_getXmtEventId
;; [ 10] MCBSP_read
;; [ 11] MCBSP_write
;; [ 12] MCBSP_xrdy
;; [ 13] MCBSP_rrdy
;; [ 14] MCBSP_config
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_IRQ_map
	.global	_DSK6713_init
	.global	_MCBSP_start
	.global	_DSK6713_AIC23_openCodec
	.global	_DSK6713_AIC23_setFreq
	.global	__IRQ_eventTable
	.global	_DSK6713_AIC23_codecdatahandle
	.global	_fs

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************
	.sym	_DSK6713_AIC23_CodecHandle, 0, 4, 13, 32
	.sym	_Uint32, 0, 14, 13, 32
	.sym	_Uint32, 0, 14, 13, 32
	.stag	_DSK6713_AIC23_Config, 320
	.member	_regs, 0, 52, 8, 320, , 10
	.eos
	.sym	_DSK6713_AIC23_Config, 0, 8, 13, 320,_DSK6713_AIC23_Config
	.stag	$$fake0, 192
	.member	_allocated, 0, 14, 8, 32
	.member	_xmtEventId, 32, 14, 8, 32
	.member	_rcvEventId, 64, 14, 8, 32
	.member	_baseAddr, 96, 30, 8, 32
	.member	_drrAddr, 128, 14, 8, 32
	.member	_dxrAddr, 160, 14, 8, 32
	.eos
	.sym	_MCBSP_Handle, 0, 24, 13, 32,$$fake0
	.stag	$$fake1, 256
	.member	_spcr, 0, 14, 8, 32
	.member	_rcr, 32, 14, 8, 32
	.member	_xcr, 64, 14, 8, 32
	.member	_srgr, 96, 14, 8, 32
	.member	_mcr, 128, 14, 8, 32
	.member	_rcer, 160, 14, 8, 32
	.member	_xcer, 192, 14, 8, 32
	.member	_pcr, 224, 14, 8, 32
	.eos
	.sym	_MCBSP_Config, 0, 8, 13, 256,$$fake1
	.utag	$$fake2, 32
	.member	_uint, 0, 14, 11, 32
	.member	_channel, 0, 51, 11, 32, , 2
	.eos
