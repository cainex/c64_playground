#import "../common/cia1_regs.asm"
#import "../common/cia2_regs.asm"
#import "../common/vic_regs.asm"

        * = $0801
            BasicUpstart(start)
            
        * = $8000

start:
         sei              //disable interrupts

         lda #$00         //load $00 into A
         sta VIC_CNTRL1        //turn off screen. (now you have only borders!)
         sta VIC_BORDER_COL    //make border black.

main:   
        ldy ydir
        cpy #1
        bne downdir
updir:  ldy ypos         //load $7a into Y. this is the line where our rasterbar will start.
        dey
        cpy #$60
        beq resy
        jmp cont
downdir:
        ldy ypos
        iny
        cpy #$a0
        bne cont
resy:   lda ydir
        eor #$01
        sta ydir
cont:   sty ypos
        ldx #$00         //load $00 into X

loop:    lda colors,x
         cpy VIC_RASTER_CNT        //ComPare current value in Y with the current rasterposition.
         bne *-3          //is the value of Y not equal to current rasterposition? then jump back 3 bytes (to cpy).

         sta VIC_BORDER_COL        //if it IS equal, store the current value of A (a color of our rasterbar)
                          //into the bordercolour

         cpx #51          //compare X to #51 (decimal). have we had all lines of our bar yet?
         beq main         //Branch if EQual. if yes, jump to main.

         inx              //increase X. so now we're gonna read the next color out of the table.
         iny              //increase Y. go to the next rasterline.

         jmp loop         //jump to loop.


colors:
         .byte $06,$06,$06,$0e,$06,$0e
         .byte $0e,$06,$0e,$0e,$0e,$03
         .byte $0e,$03,$03,$0e,$03,$03
         .byte $03,$01,$03,$01,$01,$03
         .byte $01,$01,$01,$03,$01,$01
         .byte $03,$01,$03,$03,$03,$0e
         .byte $03,$03,$0e,$03,$0e,$0e
         .byte $0e,$06,$0e,$0e,$06,$0e
         .byte $06,$06,$06,$00,$00,$00

         .byte $ff

ypos:
        .byte $7a
ydir:
        .byte 0