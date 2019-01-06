main:
        sei
        jsr init_screen
        SetCharMemLocation(GetCharMemValue(charset))
        SetScreenMemLocation(GetScreenMemValue(screen))
        lda #$00
        sta offset
        jsr fill_map_offsets
        jsr fill_menu

        //// Set up interrupt

set_irq:
        // Turn off other interrupts
        ClearIntMask()

        // Turn off BASIC and KERNAL ROMs
        // SetMemMapMode(RAM_IO_RAM)

        // Enable VIC=II interrupt
        lda #$01
        sta VIC_INT_EN

        // Set IRQ subroutine
        lda #<irq
        ldx #>irq
        sta BASIC_IRQ_VEC_LO
        stx BASIC_IRQ_VEC_HI

        lda #$00
        sta VIC_RASTER_CNT

        // Set initial raster line interrupt
        lda VIC_CNTRL1
        and #$7f
        sta VIC_CNTRL1

        cli
        jmp *

irq:
        dec VIC_INT_REG

        lda VIC_RASTER_CNT
        cmp #$00
        beq first_run

        lda #$00
        sta VIC_RASTER_CNT

        SetCharMemLocation(GetCharMemValue(menu_charset))
        jmp irq_cont

first_run:
        lda #$A9
        sta VIC_RASTER_CNT

        SetCharMemLocation(GetCharMemValue(charset))

irq_cont:
        jmp $ea81

screen_swap:
        .byte $00
        
