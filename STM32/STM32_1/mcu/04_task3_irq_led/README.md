# 과제3 ISR LED 간격 변경

[공유 소스](../project/Core/Src/ece2_474_routine.c), STM32_1_STAGE=4. 버튼 ISR에서 간격 10/20/40/80 tick을 선택하고 TIM6 100ms ISR에서 PA5를 토글합니다. 변경 직후 첫 간격은 타이머 위상 때문에 최대 100ms 짧을 수 있습니다.

[실제 시연영상](evidence/board_demo.mp4): 원본 과제3영상.mp4, 52.57초. 사용자의 최종 분류를 반영했습니다. 영상에서 주요 장면을 추출했으며 정밀 시간 측정으로 간주하지 않습니다.
