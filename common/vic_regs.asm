// VIC-II Base Address
.const VIC_BASE=$d000
.const COLOR_RAM=$d800

.const VIC_BANK0=$0000
.const SPR_PTR_BASE=$07f8

// Sprite Co-ordinate Registers
.const SPR_M0X=VIC_BASE
.const SPR_M0Y=VIC_BASE+1
.const SPR_M1X=VIC_BASE+2
.const SPR_M1Y=VIC_BASE+3
.const SPR_M2X=VIC_BASE+4
.const SPR_M2Y=VIC_BASE+5
.const SPR_M3X=VIC_BASE+6
.const SPR_M3Y=VIC_BASE+7
.const SPR_M4X=VIC_BASE+8
.const SPR_M4Y=VIC_BASE+9
.const SPR_M5X=VIC_BASE+10
.const SPR_M5Y=VIC_BASE+11
.const SPR_M6X=VIC_BASE+12
.const SPR_M6Y=VIC_BASE+13
.const SPR_M7X=VIC_BASE+14
.const SPR_M7Y=VIC_BASE+15
.const SPR_MnX8=VIC_BASE+16
.const VIC_CNTRL1=VIC_BASE+17
.const VIC_RASTER_CNT=VIC_BASE+18
.const VIC_LIGHT_PENX=VIC_BASE+19
.const VIC_LIGHT_PENY=VIC_BASE+20
.const SPR_ENABLE=VIC_BASE+21
.const VIC_CNTRL2=VIC_BASE+22
.const SPR_Y_EXPAND=VIC_BASE+23
.const VIC_MEM_PTRS=VIC_BASE+24
.const VIC_INT_REG=VIC_BASE+25
.const VIC_INT_EN=VIC_BASE+26
.const SPR_DATA_PRI=VIC_BASE+27
.const SPR_MC=VIC_BASE+28
.const SPR_X_EXPAND=VIC_BASE+29
.const SPR_SPR_COLL=VIC_BASE+30
.const SPR_DATA_COLL=VIC_BASE+31
.const VIC_BORDER_COL=VIC_BASE+32
.const VIC_BKGND_COL0=VIC_BASE+33
.const VIC_BKGND_COL1=VIC_BASE+34
.const VIC_BKGND_COL2=VIC_BASE+35
.const VIC_BKGND_COL3=VIC_BASE+36
.const SPR_MC_MM0=VIC_BASE+37
.const SPR_MC_MM1=VIC_BASE+38
.const SPR_COL0=VIC_BASE+39
.const SPR_COL1=VIC_BASE+40
.const SPR_COL2=VIC_BASE+41
.const SPR_COL3=VIC_BASE+42
.const SPR_COL4=VIC_BASE+43
.const SPR_COL5=VIC_BASE+44
.const SPR_COL6=VIC_BASE+45
.const SPR_COL7=VIC_BASE+46

.macro SetSpritePtr(spr, ptr) {
    lda #ptr
    sta SPR_PTR_BASE+(spr*1)
}

.macro SetSpriteXY(spr, x, y) {
    lda #(x&$ff)
    sta SPR_M0X+(spr*2)
    lda SPR_MnX8
    ora #(((x/256)&$1)*(1*spr))
    sta SPR_MnX8
    lda #y
    sta SPR_M0Y+(spr*2)
}

.macro SetSpriteX(spr,x) {
    lda #(x&$ff)
    sta SPR_M0X+(spr*2)
    lda SPR_MnX8
    ora #(((x/256)&$1)*(1<<spr))
    sta SPR_MnX8
}

.macro SetSpriteY(spr,y) {
    lda #y
    sta SPR_M0Y+(spr*2)
}

.macro EnableSprite(spr) {
    lda SPR_ENABLE
    ora #(1<<spr)
    sta SPR_ENABLE
}

.macro DisableSprite(spr) {
    lda SPR_ENABLE
    and #(256 - (1<<spr))
    sta SPR_ENABLE
}

.macro ToggleSprite(spr) {
    lda SPR_ENABLE
    eor #(1<<spr)
    sta SPR_ENABLE
}

//$D018 = %xxxx000x -> charmem is at $0000
//$D018 = %xxxx001x -> charmem is at $0800
//$D018 = %xxxx010x -> charmem is at $1000
//$D018 = %xxxx011x -> charmem is at $1800
//$D018 = %xxxx100x -> charmem is at $2000
//$D018 = %xxxx101x -> charmem is at $2800
//$D018 = %xxxx110x -> charmem is at $3000
//$D018 = %xxxx111x -> charmem is at $3800
.function GetCharMemValue(loc) {
    .return loc/$800<<1
}

//$D018 = %0000xxxx -> screenmem is at $0000
//$D018 = %0001xxxx -> screenmem is at $0400
//$D018 = %0010xxxx -> screenmem is at $0800
//$D018 = %0011xxxx -> screenmem is at $0c00
//$D018 = %0100xxxx -> screenmem is at $1000
//$D018 = %0101xxxx -> screenmem is at $1400
//$D018 = %0110xxxx -> screenmem is at $1800
//$D018 = %0111xxxx -> screenmem is at $1c00
//$D018 = %1000xxxx -> screenmem is at $2000
//$D018 = %1001xxxx -> screenmem is at $2400
//$D018 = %1010xxxx -> screenmem is at $2800
//$D018 = %1011xxxx -> screenmem is at $2c00
//$D018 = %1100xxxx -> screenmem is at $3000
//$D018 = %1101xxxx -> screenmem is at $3400
//$D018 = %1110xxxx -> screenmem is at $3800
//$D018 = %1111xxxx -> screenmem is at $3c00
.function GetScreenMemValue(loc) {
    .return loc/$400<<4
}

.macro SetCharMemLocation(loc) {
    lda VIC_MEM_PTRS
    and #$f1
    ora #loc
    sta VIC_MEM_PTRS
}

.macro SetScreenMemLocation(loc) {
    lda VIC_MEM_PTRS
    and #$0f
    ora #loc
    sta VIC_MEM_PTRS
}

.macro ClearIntMask (){
    ldy #$7f
    sty CIA1_IRQ
    sty CIA2_IRQ
    lda CIA1_IRQ
    lda CIA2_IRQ
}