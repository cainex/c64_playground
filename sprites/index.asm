#import "../common/vic_regs.asm"

            * = $0801
            BasicUpstart(start)

            * = $2000
#import "sprite1_data.asm"
            * = $2040
#import "sprite2_data.asm"

            * = $c000
#import "main.asm"

#import "init_clear_screen.asm"

#import "init_sprite.asm"
