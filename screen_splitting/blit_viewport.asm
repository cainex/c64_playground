fill_map_offsets:
.for (var h = 0; h < MAP_HEIGHT; h++) {
    clc 
    lda offset
    adc map_starts+(2*h)
    sta map_offsets+(2*h)
    lda #$00
    adc map_starts+(2*h)+1
    sta map_offsets+(2*h)+1
}

blit_viewport:
    ldy offset_y
.for (var h = 0; h < VIEWPORT_HEIGHT; h++) {
    ldx map_offsets+[2*h], y
    stx blit_loc[h].map_loc+1
    ldx map_offsets+1+[2*h], y
    stx blit_loc[h].map_loc+2
}

blit_loc: .for (var h = 0; h < VIEWPORT_HEIGHT; h++) {
    ldx #VIEWPORT_WIDTH
map_loc:
    lda $ffff,x
    sta screen+[VIEWPORT_Y*40]+VIEWPORT_X+[h*40],x
    tay
    lda colors,y
    sta COLOR_RAM+[VIEWPORT_Y*40]+VIEWPORT_X+[h*40],x
    dex
    bne map_loc
}
    rts

fill_menu: .for (var h = 0; h < 10; h++) {
    ldx #$28
!loop:  
    lda menu_map+[h*40]-1, x 
    sta screen+[15*40]+[h*40]-1, x
    tay 
    lda menu_colors,y 
    sta COLOR_RAM+[15*40]+[h*40]-1, x 
    dex
    bne !loop-
}
    rts
