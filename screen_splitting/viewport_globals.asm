
map_starts:
.for (var h = 0; h < MAP_HEIGHT; h++) {
    .word map+(h*MAP_WIDTH)
}

map_offsets:
.for (var h = 0; h < MAP_HEIGHT; h++) {
    .word $0000
}

offset:
    .byte $00

offset_y:
    .byte $06
