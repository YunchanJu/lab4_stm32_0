# STM32_1 실험 직전 실행 안내
주윤찬 · 2023440132 · 2026-10-19

## 코드와 빌드
Core/Src/ece2_474_routine.c: 작성 완료. Core/Inc/stm32_1_config.h의 STM32_1_STAGE 숫자로 선택합니다.

| 숫자 | 동작 |
|---|---|
| 1 | 버튼 인터럽트로 내장 LED 토글 |
| 2 | TIM6 100ms × 10 = LED 상태 1초마다 변경 |
| 3 | PB4 PWM 1kHz, 듀티 50% |
| 4 (현재) | 과제3: 버튼으로 LED 상태 변경 간격 1→2→4→8→1초 |
| 5 | 과제4: 버튼으로 PWM 듀티 25→50→75→25% |

모든 모드 ARM 빌드와 실제 C 소스를 사용한 모의 HAL 로직 검증 PASS. verification 폴더의 JSON과 로그 참조.
firmware 폴더에 모드별 ELF/HEX가 있습니다. 현재 build/stm32/Debug/ece2_474.elf는 과제3입니다.

## 보드에서 실행할 때
1. ece2_474.code-workspace를 VS Code에서 엽니다.
2. 원하는 STM32_1_STAGE를 저장하고 STM32 확장의 Build를 실행합니다.
3. ST-Link USB 연결 후 F5. main에서 멈추면 F5로 계속 실행합니다.
4. 다른 모드로 변경하면 반드시 다시 Build하고 F5로 다운로드합니다.

PC13: 사용자 버튼. PA5: 내장 LED. PB4: TIM3 CH1 PWM 출력. PWM 측정은 PB4와 GND에 연결합니다.
버튼 입력은 200ms 이내 재입력을 무시합니다. TIM6 우선순위4, 버튼7. polling_routine은 비어 있습니다.
과제3 변경 직후 첫 간격은 TIM6의 현재 위상 때문에 최대 100ms 짧아질 수 있습니다. 정상 반복 간격은 1/2/4/8초, 켜짐+꺼짐 전체 주기는 2/4/8/16초입니다.
PWM 주기 1ms, HIGH 시간은 각각 250/500/750μs입니다.

## 과제4 디버거
모드5로 변경·저장·Build 후 F5. button_isr_p7의 BREAKPOINT HERE 다음 g_pwm_step 대입 줄에 F9로 중단점을 둡니다.
Watch: g_pwm_step, g_pwm_ccr, htim3.Instance->CCR1.
버튼 입력 후 F10으로 한 줄씩 진행하여 CCR 250/500/750을 확인합니다. F11은 함수 내부 진입, F5는 계속 실행, Shift+F5는 종료입니다.
파형의 시간은 중단점을 제거한 정상 실행 상태에서 측정합니다.

실제 보드 다운로드·버튼 동작·파형 측정은 아직 수행하지 않았습니다. 기록은 실험 후 작성합니다.
