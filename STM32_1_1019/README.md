# 10/19 STM32_1 예비 실험 자료
주윤찬 · 2023440132

- stm32_lab/ece2_474.code-workspace: VS Code 전체 프로젝트
- Core/Inc/stm32_1_config.h: 1=버튼 예제, 2=TIM6 예제, 3=PWM50%, 4=과제3, 5=과제4
- firmware: 모드별 ELF/HEX. 설정 변경 후 Build 및 F5 다운로드가 필요합니다.
- fpga/piano, traffic, adc: RTL, TB, XDC 및 재생성 Tcl. 신호등·ADC의 물리 핀은 미확인입니다.
- verification: 실제 빌드·로직검증 로그, 코드 캡처. fpga/*/verification에는 Vivado 결과가 있습니다.
- 예비레포트 PDF와 측정기록.csv: 사전 준비·예상 동작 및 실험 후 기록 양식
- OPEN_ITEMS.md: 실제 보드 실행 전 확인 사항

현재 선택 모드는 stm32_1_config.h를 확인하세요. 실험 영상·실측은 실험 후 새로 추가하며 사전 검증을 실측으로 표시하지 않습니다.
