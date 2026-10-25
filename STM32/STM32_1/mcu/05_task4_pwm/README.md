# 과제4 PWM과 디버거

[공유 소스](../project/Core/Src/ece2_474_routine.c), STM32_1_STAGE=5. PB4 TIM3 CH1, 목표 1kHz. 버튼마다 CCR=250/500/750 순환.

[실제 파형영상](evidence/scope_demo.mp4): 원본 과제3 오실로.mp4, 8.47초. 디버거 사진은 CCR 250→500→750→250, 계측 사진은 24.79%/50.34%/74.98%를 나타냅니다. CCR 값은 주기가 아니라 비교값입니다.

[측정 표](../../evidence/pwm_measurements.csv). 중단점에서 멈춘 시간은 정상 동작 시간 측정에 사용하지 않습니다.
