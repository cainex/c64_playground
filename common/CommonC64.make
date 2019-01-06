KICKASS_JAR = /mnt/c/Users/user/Documents/commodore64/KickAss/KickAss.jar
VICE = /mnt/c/Users/user/Documents/commodore64/WinVICE-3.1-x64/x64.exe
C64DEBUGGER = /mnt/c/Users/user/Documents/commodore64/C64Debugger/C64Debugger.exe

ASM = java -jar $(KICKASS_JAR)

all: $(PRG)

$(PRG) : $(TOP_ASM) $(DEPS)
	$(ASM) -bytedump -o $(PRG) $(TOP_ASM)

.PHONY: run
run: $(PRG)
	$(VICE) $(PRG)

.PHONY: debug
debug: $(PRG)
	$(C64DEBUGGER) -prg $(PRG)

.PHONY: clean
clean:
	rm -f *.prg *.sym ByteDump.txt

