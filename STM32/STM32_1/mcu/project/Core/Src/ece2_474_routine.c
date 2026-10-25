/* Authored on this PC, 2026-10-26: STM32_1 exercises and tasks 3/4.
 * This is a new implementation, not the binary used in the October 19 video.
 * TIM6: 100 ms, IRQ priority 4. Button EXTI: priority 7.
 */
#include "ece2_474.h"
#include "main.h"
#include "stm32_1_config.h"

volatile uint32_t g_led_interval_ticks = 10U;
volatile uint32_t g_tim6_count = 0U;
volatile uint32_t g_pwm_ccr = 250U;
volatile uint32_t g_pwm_step = 0U;
static uint32_t last_button_ms;
static uint8_t button_has_timestamp;

static uint8_t accept_button(void)
{
    uint32_t now = HAL_GetTick();
    /* Unsigned subtraction also handles the millisecond counter wrapping. */
    if (button_has_timestamp && (uint32_t)(now-last_button_ms)<200U)
        return 0U;
    last_button_ms = now;
    button_has_timestamp = 1U;
    return 1U;
}

void ece2_474_init(void)
{
    last_button_ms = 0U;
    button_has_timestamp = 0U;
    g_tim6_count = 0U;
    g_led_interval_ticks = 10U;
    g_pwm_step = 0U;
    g_pwm_ccr = (STM32_1_STAGE == 3) ? 500U : 250U;
    HAL_GPIO_WritePin(LED_ece2_GPIO_Port,LED_ece2_Pin,GPIO_PIN_RESET);
#if STM32_1_STAGE == 2 || STM32_1_STAGE == 4
    if (HAL_TIM_Base_Start_IT(&htim6)!=HAL_OK) Error_Handler();
#elif STM32_1_STAGE == 3 || STM32_1_STAGE == 5
    __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_1,g_pwm_ccr);
    if (HAL_TIM_PWM_Start(&htim3,TIM_CHANNEL_1)!=HAL_OK) Error_Handler();
#endif
}

void polling_routine(void)
{
    /* All exercise actions are dispatched from the HAL interrupt callbacks. */
}

static void button_isr_p7(void)
{
#if STM32_1_STAGE == 1 || STM32_1_STAGE == 4 || STM32_1_STAGE == 5
    if (!accept_button()) return;
#if STM32_1_STAGE == 1
    HAL_GPIO_TogglePin(LED_ece2_GPIO_Port,LED_ece2_Pin);
#elif STM32_1_STAGE == 4
    static const uint32_t choices[4] = {10U,20U,40U,80U};
    uint32_t next = 0U;
    while (next<3U && choices[next]!=g_led_interval_ticks) ++next;
    next = (next+1U)&3U;
    /* Publish both shared values atomically against the higher-priority TIM6. */
    uint32_t saved = __get_PRIMASK();
    __disable_irq();
    g_led_interval_ticks = choices[next];
    g_tim6_count = 0U;
    __set_PRIMASK(saved);
#elif STM32_1_STAGE == 5
    static const uint32_t compare[3] = {250U,500U,750U};
    /* Place a breakpoint here; use F10 and watch CCR / TIM3->CCR1. */
    uint32_t next = g_pwm_step+1U;
    if (next==3U) next=0U;
    g_pwm_step = next;
    g_pwm_ccr = compare[next];
    __HAL_TIM_SET_COMPARE(&htim3,TIM_CHANNEL_1,g_pwm_ccr);
#endif
#endif
}

static void tim6_isr_p4(void)
{
#if STM32_1_STAGE == 2 || STM32_1_STAGE == 4
    uint32_t limit = (STM32_1_STAGE == 2) ? 10U : g_led_interval_ticks;
    uint32_t elapsed = g_tim6_count+1U;
    if (elapsed>=limit) {
        elapsed=0U;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port,LED_ece2_Pin);
    }
    g_tim6_count=elapsed;
#endif
}

void HAL_GPIO_EXTI_Callback(uint16_t pin)
{
    if (pin==BUTTON_ece2_Pin) button_isr_p7();
}
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *timer)
{
    if (timer->Instance==TIM6) tim6_isr_p4();
}
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *uart) { (void)uart; }
