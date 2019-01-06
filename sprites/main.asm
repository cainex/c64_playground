#import "../common/cia1_regs.asm"
#import "../common/cia2_regs.asm"

start:
            sei

            jsr init_screen
            jsr init_sprite

set_irq:
            ClearIntMask()

            lda #$01
            sta VIC_INT_EN

            lda #<irq
            ldx #>irq
            sta $0314
            stx $0315

            lda #$00
            sta VIC_RASTER_CNT

            lda VIC_CNTRL1
            and #$7f
            sta VIC_CNTRL1

            cli
            jmp *
irq:

            dec VIC_INT_REG

            lda SPR_PTR_BASE
            eor #$01
            sta SPR_PTR_BASE

            lda SPR_M0Y
            eor #$50
            sta SPR_M0Y

            jmp $ea81

