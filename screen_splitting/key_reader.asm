read_key:
    lda #%11111111
    sta CIA1_PORTA_DIR
    lda #%00000000
    sta CIA1_PORTB_DIR

    lda #KEY_ROW_1
    sta CIA1_PORTA 

    clc

    lda CIA1_PORTB 
    and #KEY_w
    beq w_press

    lda CIA1_PORTB 
    and #KEY_a
    beq a_press

    lda CIA1_PORTB 
    and #KEY_s
    beq s_press

    lda CIA1_PORTB 
    and #KEY_z
    beq z_press
    jmp done_read_key

z_press:
    inc offset_y
    inc offset_y
    jmp done_read_key

w_press:
    dec offset_y
    dec offset_y
    jmp done_read_key

a_press:
    dec offset 
    jmp done_read_key

s_press:
    inc offset

done_read_key:
    rts

