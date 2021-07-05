
ENTRY(start);

MEMORY {
 RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
 FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 64K
}

SECTIONS
{
  .text :
  {
    . = ALIGN(4);
    __text_start = .;
    *(.isr_vector)
    *(.text)
    *(.text*)
    *(.rodata)
    *(.rodata*)
    . = ALIGN(4);
    __text_end = .;
  } > FLASH

  __data_flash = .;

  .data : AT ( __data_flash )
  {
    . = ALIGN(4);
    __data_start = .;
    *(.data)
    *(.data*)
    . = ALIGN(4);
    __data_end = .;
  } > RAM

  __data_size = SIZEOF(.data);

  .bss :
  {
    __bss_start = .;
    *(.bss)
    *(.bss*)
    *(COMMON)
    . = ALIGN(4);
    __bss_end = .;
  } > RAM

  __stack_size = 1024;
  __stack_end = ORIGIN(RAM)+LENGTH(RAM);
  __stack_start = __stack_end - __stack_size;
  . = __stack_start;
  .stack :
  {
    . = . + __stack_size;
  } > RAM

}
