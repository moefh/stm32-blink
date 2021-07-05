
        @ =====================================================
        @ periferal base offsets
        @ =====================================================
        
        .set stm32_TIM1,           0x40012c00
        .set stm32_TIM2,           0x40000000
        .set stm32_TIM3,           0x40000400
        .set stm32_TIM4,           0x40000800
        .set stm32_TIM5,           0x40000c00
        .set stm32_TIM6,           0x40001000
        .set stm32_TIM7,           0x40001400
        .set stm32_TIM8,           0x40013400
        .set stm32_TIM9,           0x40014c00
        .set stm32_TIM10,          0x40015000
        .set stm32_TIM11,          0x40015400
        .set stm32_TIM12,          0x40001800
        .set stm32_TIM13,          0x40001c00
        .set stm32_TIM14,          0x40002000

        .set stm32_RTC,            0x40002800
        .set stm32_WWDG,           0x40002c00
        .set stm32_IWDG,           0x40003000

        .set stm32_SPI1,           0x40013000
        .set stm32_SPI2_I2S,       0x40003800
        .set stm32_SPI3_I2S,       0x40003c00
        .set stm32_USART1,         0x40013800
        .set stm32_USART2,         0x40004400
        .set stm32_USART3,         0x40004800
        .set stm32_UART4,          0x40004c00
        .set stm32_UART5,          0x40005000
        .set stm32_I2C1,           0x40005400
        .set stm32_I2C2,           0x40005800

        .set stm32_USB_FS,         0x40005c00
        .set stm32_USB_OTG_FS,     0x50000000
        .set stm32_USB_RAM,        0x40006000
        .set stm32_CAN1,           0x40006400
        .set stm32_CAN2,           0x40006800

        .set stm32_BKP,            0x40006c00
        .set stm32_PWR,            0x40007000
        .set stm32_DAC,            0x40007400

        .set stm32_AFIO,           0x40010000
        .set stm32_EXTI,           0x40010400

        .set stm32_GPIO_PORT_A,    0x40010800
        .set stm32_GPIO_PORT_B,    0x40010c00
        .set stm32_GPIO_PORT_C,    0x40011000
        .set stm32_GPIO_PORT_D,    0x40011400
        .set stm32_GPIO_PORT_E,    0x40011800
        .set stm32_GPIO_PORT_F,    0x40011c00
        .set stm32_GPIO_PORT_G,    0x40012000

        .set stm32_ADC1,           0x40012400
        .set stm32_ADC2,           0x40012800
        .set stm32_ADC3,           0x40013c00

        .set stm32_SDIO,           0x40018000
        .set stm32_DMA1,           0x40020000
        .set stm32_DMA2,           0x40020400

        .set stm32_RCC,            0x40021000
        .set stm32_FLASH,          0x40022000
        .set stm32_CRC,            0x40023000
        .set stm32_ETHERNET,       0x40028000
        .set stm32_FSMC,           0xa0000000


        
        @ =====================================================
        @ stm32_RCC (reset and clock control)
        @ =====================================================

        .set stm32_RCC_CR,            0x00
        .set stm32_RCC_CFGR,          0x04
        .set stm32_RCC_CIR,           0x08
        .set stm32_RCC_APB2RSTR,      0x0c
        .set stm32_RCC_APB1RSTR,      0x10
        .set stm32_RCC_AHBENR,        0x14
        .set stm32_RCC_APB2ENR,       0x18
        .set stm32_RCC_APB1ENR,       0x1c
        .set stm32_RCC_BDCR,          0x20
        .set stm32_RCC_CSR,           0x24
       

        @ =====================================================
        @ stm32_GPIO_PORT_x (GPIO ports A-G)
        @ =====================================================

        .set stm32_GPIOx_CRL,         0x00
        .set stm32_GPIOx_CRH,         0x04
        .set stm32_GPIOx_IDR,         0x08
        .set stm32_GPIOx_ODR,         0x0c    @
        .set stm32_GPIOx_BSRR,        0x10    @ [15:0]=set, [31:16]=reset (set has proprity)
        .set stm32_GPIOx_BRR,         0x14    @ [15:0]=reset
        .set stm32_GPIOx_LCKR,        0x18
