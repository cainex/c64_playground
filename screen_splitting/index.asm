#import "../common/common.asm"
#import "../common/cia1_regs.asm"
#import "../common/cia2_regs.asm"
#import "../common/vic_regs.asm"
#import "defs.asm"

* = $0801
    BasicUpstart(main)

* = $C000
#import "main.asm"
#import "init_clear_screen.asm"
#import "blit_viewport.asm"

* = $5000
#import "minirogue-c64-map.asm"

* = $4000
#import "menu-map.asm"

* = $3000
#import "minirogue-c64-charset.asm"
#import "minirogue-c64-colors.asm"

* = $2000
#import "menu-charset.asm"
#import "menu-colors.asm"

* = $1000
#import "viewport_globals.asm"

