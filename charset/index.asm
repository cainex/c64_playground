#import "../common/cia1_regs.asm"
#import "../common/cia2_regs.asm"
#import "../common/vic_regs.asm"
        * = $0801
            BasicUpstart(main)

        * = $9000
#import "minirogue-c64-colors.asm"

        * = $8000
#import "main.asm"

        * = $3000
#import "minirogue-c64-map.asm"

        * = $2000
#import "minirogue-c64-charset.asm"

