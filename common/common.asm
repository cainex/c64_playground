.const BANK_MODE=$01

.const RAM_RAM_RAM=$00
.const RAM_CHARROM_RAM=$01
.const RAM_CHARROM_KERNAL=$02
.const BASIC_CHARROM_KERNAL=$03
.const RAM_IO_RAM=$05
.const RAM_IO_KERNAL=$06
.const BASIC_IO_KERNAL=$07

.const BASIC_IRQ_VEC_LO=$0314
.const BASIC_IRQ_VEC_HI=$0315

.const IRQ_VEC_LO=$fffe
.const IRQ_VEC_HI=$ffff

.const KERNAL_ROM_0=$e000
.const KERNAL_ROM_1=$f000

.macro SetMemMapMode (mode) {
    lda #$30|mode
    sta BANK_MODE
}
