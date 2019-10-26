lab3.obj
-o lab3.out
-m lab3.map
    /*        TMS320C50  LINKER COMMAND FILE                        */
    /*        9k RAM > Prog.Mem, BO > Data Mem, uComputer Mode      */
 
MEMORY   {
   PAGE 0:                                         /* Program space */
          VECS      :  o = 0000H  ,  l = 0040H     /*  Std.Vectors  */
          PROG      :  o = 0040H  ,  l = 07C0H     /*  2k ROM       */
          RAM       :  o = 0800H  ,  l = 2000H     /*  9k RAM Block */
          EXT       :  o = 2C00H  ,  l =0D400H     /*  External Mem */
   PAGE 1:                                         /* Data space    */
          REGS      :  o = 0000H  ,  l = 0060H     /*  MMR'S        */
          BLKB2     :  o = 0060H  ,  l = 0020H     /*  BLK B2       */
          I_RAM     :  o = 0100H  ,  l = 0400H     /*  BLK B0 & B1  */
          EXT       :  o = 0800H  ,  l =0F800H     /*  External Mem */
          }
SECTIONS  {
          .text     :  {}   >   PROG    PAGE 0     /*  Code...      */
          .data     :  {}   >   I_RAM   PAGE 1     /*  Tables...    */
          .bss      :  {}   >   BLKB2   PAGE 1     /*  Variables... */
          vectors   :  {}   >   VECS    PAGE 0     /*  Vector table */
          }
