#include "ece2_474.h"
#include "main.h"
#include "stm32_1_config.h"

/* File globals are visible in the debugger. TIM6 priority 4, button 7. */
volatile uint32_t g_led_interval_ticks = 10U; /* 100ms ticks: 10,20,40,80 */
volatile uint32_t g_tim6_count = 0U;
volatile uint32_t g_pwm_ccr = 250U;
volatile uint32_t g_pwm_step = 0U;
#if STM32_1_STAGE == 1 || STM32_1_STAGE == 4 || STM32_1_STAGE == 5
static uint32_t last_press_ms = 0U;
static uint32_t button_seen = 0U;
#endif

void ece2_474_init(void)
{
    HAL_GPIO_WritePin(LED_ece2_GPIO_Port, LED_ece2_Pin, GPIO_PIN_RESET);
#if STM32_1_STAGE == 2 || STM32_1_STAGE == 4
    if (HAL_TIM_Base_Start_IT(&htim6) != HAL_OK) Error_Handler();
#elif STM32_1_STAGE == 3 || STM32_1_STAGE == 5
#if STM32_1_STAGE == 3
    g_pwm_ccr = 500U;
#else
    g_pwm_step = 0U;
    g_pwm_ccr = 250U;
#endif
    /* Load compare before enabling PWM to avoid an initial wrong duty. */
    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, g_pwm_ccr);
    if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1) != HAL_OK) Error_Handler();
#endif
}

void polling_routine(void)
{
    /* Intentionally empty: no polling of button, tick, LED, or PWM. */
}

static void button_isr_p7(void)
{
#if STM32_1_STAGE == 1 || STM32_1_STAGE == 4 || STM32_1_STAGE == 5
    uint32_t now_ms = HAL_GetTick();
    if (button_seen && (uint32_t)(now_ms - last_press_ms) < 200U) return;
    button_seen = 1U;
    last_press_ms = now_ms;
#if STM32_1_STAGE == 1
    HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
#elif STM32_1_STAGE == 4
    /* volatile is not mutual exclusion. Protect this two-value update. */
    uint32_t primask = __get_PRIMASK();
    __disable_irq();
    g_led_interval_ticks = (g_led_interval_ticks == 80U)
                         ? 10U : g_led_interval_ticks * 2U;
    g_tim6_count = 0U;
    __set_PRIMASK(primask);
#elif STM32_1_STAGE == 5
    /* BREAKPOINT HERE: inspect step, CCR, and TIM3->CCR1 with F10. */
    g_pwm_step = (g_pwm_step + 1U) % 3U;
    g_pwm_ccr = 250U * (g_pwm_step + 1U);
    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, g_pwm_ccr);
#endif
#endif
}

static void tim6_isr_p4(void)
{
#if STM32_1_STAGE == 2
    if (++g_tim6_count >= 10U) {
        g_tim6_count = 0U;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
    }
#elif STM32_1_STAGE == 4
    if (++g_tim6_count >= g_led_interval_ticks) {
        g_tim6_count = 0U;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
    }
#endif
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == BUTTON_ece2_Pin) button_isr_p7();
}
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM6) tim6_isr_p4();
}
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    (void)huart; /* No UART receive exercise in this week. */
}
