#ifndef STM32_0_CONFIG_H
#define STM32_0_CONFIG_H

/* Change only this number, then Build and F5 download again.
 * 1 = example: internal LED, 1 second per state change
 * 2 = example: button toggles internal LED
 * 3 = task 1: button cycles internal LED intervals
 * 4 = task 2: same behavior on external LED
 */
#define STM32_0_STAGE 3

/* Stage 4: 1 = PB0, 2 = PB1. */
#define STM32_0_EXTERNAL_PIN 1

#if STM32_0_STAGE < 1 || STM32_0_STAGE > 4
#error "STM32_0_STAGE must be 1, 2, 3 or 4"
#endif
#if STM32_0_EXTERNAL_PIN != 1 && STM32_0_EXTERNAL_PIN != 2
#error "STM32_0_EXTERNAL_PIN must be 1 or 2"
#endif
#endif
