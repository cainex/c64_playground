

KICKASS_JAR = $(KICKASS_HOME)/KickAss.jar
VICE = $(VICE_HOME)/x64.exe
C64DEBUGGER = $(C64DEBUGGER_HOME)/C64Debugger.exe

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

