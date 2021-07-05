
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump
SIZE = arm-none-eabi-size

PROJECT = blink
LINKER_SCRIPT = stm32f103.ld
PROJECT_OBJS = main.o isr_vector.o

.PHONY: all clean dump

all: $(PROJECT).bin

clean:
	rm -f *.o *.elf *.bin

dump: $(PROJECT).elf
	@echo ========================================================
	$(OBJDUMP) -d $<
	@echo ========================================================
	$(SIZE) -A -x $<


$(PROJECT).bin: $(PROJECT).elf
	$(OBJCOPY) -O binary $< $@

$(PROJECT).elf: $(PROJECT_OBJS)
	$(LD) -T$(LINKER_SCRIPT) -o $@ $(PROJECT_OBJS)

%.o: %.s
	$(AS) $(AS_FLAGS) -o $@ $<
