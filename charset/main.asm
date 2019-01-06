main:
        sei
        lda #$00
        sta VIC_BORDER_COL
        sta VIC_BKGND_COL0
        SetCharMemLocation(GetCharMemValue(charset))
        SetScreenMemLocation(GetScreenMemValue(map))
        jsr cpycol
        cli
        jmp *

cpycol:
        ldx #$00
!loop:  ldy map,x
        lda colors,y
        sta COLOR_RAM,x
        ldy map+256,x
        lda colors,y
        sta COLOR_RAM+256,x
        ldy map+512,x
        lda colors,y
        sta COLOR_RAM+512,x
        ldy map+768,x
        lda colors,y
        sta COLOR_RAM+768,x
        inx
        bne !loop-
        rts