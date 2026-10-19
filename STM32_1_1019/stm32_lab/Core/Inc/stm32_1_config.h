#ifndef STM32_1_CONFIG_H
#define STM32_1_CONFIG_H
/* Select 1 button IRQ, 2 TIM6 1s LED, 3 PWM 50%, 4 task3, 5 task4.
 * Save, Build, then F5 to download the changed program.
 */
#ifndef STM32_1_STAGE
#define STM32_1_STAGE 5
#endif
#if STM32_1_STAGE < 1 || STM32_1_STAGE > 5
#error "STM32_1_STAGE must be 1..5"
#endif
#endif
