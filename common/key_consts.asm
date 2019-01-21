//
//                         B7         B6        B5        B4        B3       B2          B1          B0
// 0 %1111_1110 ($fe) | Down       |    F5   |    F3   |    F1     |    F7   | Right   | Return   | Delete   |
// 1 %1111_1101 ($fd) | Left-Shift | e ($05) | s ($13) | z ($1a)   | 4 ($34) | a ($01) | w ($17)  | 3 ($33)  |
// 2 %1111_1011 ($fb) | x ($18)    | t ($14) | f ($06) | c ($03)   | 6 ($36) | d ($04) | r ($12)  | 5 ($35)  |
// 3 %1111_0111 ($f7) | v ($16)    | u ($15) | h ($08) | b ($02)   | 8 ($38) | g ($07) | y ($19)  | 7 ($37)  |
// 4 %1110_1111 ($ef) | n ($0e)    | o ($0f) | k ($0b) | m ($0d)   | 0 ($30) | j ($0a) | i ($09)  | 9 ($39)  |
// 5 %1101_1110 ($df) | ,          | @ ($00) | : ($3a) | . ($2e)   | - ($2d) | l ($0c) | p ($10)  | + ($2b)  |
// 6 %1011_1111 ($bf) | /          | ^ ($1e) | = ($3d) | r-shift   | home    | ; ($3b) | * ($2a)  | lb ($1c) |
// 7 %0111_1111 ($7f) | run-stop   | q ($11) | C=      | Spc ($20) | 2 ($32) | Control | <- ($1f) | 1 ($31)  |

// Row0
.const KEY_ROW_0=%11111110
.const KEY_Down=%10000000
.const KEY_F5=%01000000
.const KEY_F3=%00100000
.const KEY_F1=%00010000
.const KEY_F7=%00001000
.const KEY_Right=%00000100
.const KEY_Return=%00000010
.const KEY_Delete=%00000001

// Row1
.const KEY_ROW_1=%11111101
.const KEY_L_Shift=%10000000
.const KEY_e=%01000000
.const KEY_s=%00100000
.const KEY_z=%00010000
.const KEY_4=%00001000
.const KEY_a=%00000100
.const KEY_w=%00000010
.const KEY_3=%00000001
// Row2
.const KEY_ROW_2=%11111011 
.const KEY_x=%10000000
.const KEY_t=%01000000
.const KEY_f=%00100000
.const KEY_c=%00010000
.const KEY_6=%00001000
.const KEY_d=%00000100
.const KEY_r=%00000010
.const KEY_5=%00000001

// Row3
.const KEY_ROW_3=%11110111 
.const KEY_v=%10000000
.const KEY_u=%01000000
.const KEY_h=%00100000
.const KEY_b=%00010000
.const KEY_8=%00001000
.const KEY_g=%00000100
.const KEY_y=%00000010
.const KEY_7=%00000001

// Row4
.const KEY_ROW_4=%11101111 
.const KEY_n=%10000000
.const KEY_o=%01000000
.const KEY_k=%00100000
.const KEY_m=%00010000
.const KEY_0=%00001000
.const KEY_j=%00000100
.const KEY_i=%00000010
.const KEY_9=%00000001

// Row5
.const KEY_ROW_5=%11011110 
.const KEY_Comma=%10000000
.const KEY_At=%01000000
.const KEY_Colon=%00100000
.const KEY_Period=%00010000
.const KEY_Dash=%00001000
.const KEY_l=%00000100
.const KEY_p=%00000010
.const KEY_Plus=%00000001

// Row6
.const KEY_ROW_6=%10111111 
.const KEY_Slash=%10000000
.const KEY_Caret=%01000000
.const KEY_Equal=%00100000
.const KEY_R_Shift=%00010000
.const KEY_Home=%00001000
.const KEY_Semicolon=%00000100
.const KEY_Star=%00000010
.const KEY_Pound=%00000001

// Row7
.const KEY_ROW_7=%01111111 
.const KEY_Run_Stop=%10000000
.const KEY_q=%01000000
.const KEY_CBM=%00100000
.const KEY_Spc=%00010000
.const KEY_2=%00001000
.const KEY_Control=%00000100
.const KEY_Back_Arrow=%00000010
.const KEY_1=%00000001

