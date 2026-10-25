# 날짜별 제출 항목 및 현재 현황

점검일: 2026-10-26. 코드·시뮬레이션·실제 보드 자료를 구분합니다. 아래 증거 형식은 GitHub 정리 권장안이며 공식 제출 형식은 담당자 공지가 우선합니다.

공통: 결과보고서, 실행 방법과 모드, 실제 사용 소스·핀 설정, 시뮬레이션 TB와 파형/로그, 실제 보드 사진·영상 또는 계측 캡처, 예상값과 실측값 비교를 연결합니다. 펌웨어/bit는 있으면 함께 보관하며 보드 실험 성공을 의미하지 않습니다.

## 10/12 · STM32_0

| 실험 | 코드·검증 | 실제 증거 | 현황 |
|---|---|---|---|
| 예제1 1초 LED | mcu/project, 모드1 | 동작 확인 자료 | 독립 영상은 미확인 |
| 예제2 버튼 토글 | 같은 프로젝트 모드2 | 버튼 1회당 토글 | 독립 영상은 미확인 |
| 과제1 내장 LED | 모드3 | 1→2→4→8초 간격 순환 | mcu/03_task1_internal_led/evidence/board_demo.mp4 |
| 과제2 외부 LED | 모드4, PB0/PB1 | 외부 배선과 간격 순환 | mcu/04_task2_external_led/evidence/board_demo.mp4 |
| 곱셈기 | fpga/01_mult_4bit의 RTL·TB·XDC·bit | 입력과 곱셈 출력 | 해당 폴더 evidence/board_demo.mp4 |
| BCD→이진수 | fpga/02_bcd_conv의 RTL·TB·XDC·bit | 십/일 자리와 변환 출력 | 해당 폴더 evidence/board_demo.mp4 |
| 결과보고서 | reports/result.pdf | 기존 제출 결과 | 있음 |

기존 영상 4개는 원본 바이트를 보존해 이동했습니다. 모든 입력·간격을 이번 정리에서 영상을 재생해 재측정한 것은 아닙니다. 원본 사진 23개는 evidence/images에 펼쳤습니다. 영상과 보완 펌웨어의 촬영 시점 일치 여부는 미확인입니다.

## 10/19 · STM32_1

| 실험 | 코드·검증 | 추가로 연결할 실제 증거 | 현황 |
|---|---|---|---|
| 예제 버튼 IRQ | mcu/project 모드1 | 버튼→LED 토글 | 소스·빌드 기록 있음. 실제 증거 미확인 |
| 예제 TIM6 | 모드2 | 100ms×10의 LED 변경 간격 | 소스·빌드 기록 있음. 실제 증거 미확인 |
| 예제 PWM 50% | 모드3 | PB4 1kHz, HIGH 500us | 소스·빌드 기록 있음. 계측 미확인 |
| 과제3 ISR LED 간격 | 모드4 | 버튼으로 1→2→4→8초 순환, PA5 | 코드·빌드 PASS, board_demo.mp4와 영상 추출 사진 5장 보관 |
| 과제4 PWM·디버거 | 모드5 | 25/50/75% 파형, Watch·F10 캡처 | 코드·빌드 PASS, scope_demo.mp4·Watch 4장·파형 3장 보관 |
| 피아노 | fpga/01_piano | 입력별 실제 음, 시뮬레이션 비교 | RTL·TB·XDC·bit, 보드 영상·Vivado 캡처 4장 있음 |
| 신호등 | fpga/02_traffic | 52초 순환·보행자·flicker | RTL·TB·합성, 보드 영상·Vivado 캡처 5장 있음. 당시 소스·핀·bit 미확보 |
| ADC | fpga/03_adc | 채널·입력전압·디지털값, 장치 모델/Vref | RTL·TB·합성, 보드 영상·Vivado 캡처 3장 있음. 당시 소스·핀·Vref 미확보 |
| 보고서 | reports/prelab.pdf | 실측에 근거한 결과보고서 | 기존 예비레포트 보존. 새 결과보고서 작성 후 reports에 추가 |

사용자 첨부 영상 5개와 사진 19장을 해당 evidence에 보관했습니다. 과제3영상은 과제3, 과제3 오실로는 과제4로 분류했습니다. PWM 실측은 evidence/pwm_measurements.csv, 출처는 common/SOURCE_PROVENANCE.md에 기록했습니다. 예제의 별도 시연은 제공되지 않았으며 과제 자료와 중복하는 항목은 따로 완료로 단정하지 않습니다.

## 10/26 · STM32_2

- 과제5: PC↔MCU 문자와 바이트 값(1/A/a → 31/41/61 hex), C 소스·Serial Monitor 캡처.
- 과제6: PC→MCU→FPGA→PC 동일 바이트 확인, STM32 소스·FPGA UART RTL/TB·확장 GPIO XDC·배선·양쪽 출력.
- 과제7: 명령 0/1/2/기타에 따른 FPGA LED 끄기/켜기/토글/유지, 코드·명령 출력·시연.
- FPGA 서보: 20ms 프레임과 펄스 폭·실제 위치, RTL/TB/XDC·파형·시연.
- FPGA SRAM: 여러 주소의 쓰기/읽기·버스 방향, RTL/TB/XDC·일치 결과.
- FPGA DAC: 디지털값·아날로그 출력, RTL/TB/XDC·파형과 실측 비교.
- 결과보고서. MCU 과제5~7 소스·전체 프로젝트와 ARM 빌드 3개, FPGA UART/서보/SRAM/DAC RTL·TB 및 실제 Vivado GUI 시뮬레이션 PASS 4개를 준비했습니다. VS Code·Vivado 화면은 STM32_2/evidence/preparation에 있습니다. 핀 확정·실제 시연·계측은 실험 후 추가해야 합니다.

## 11/2 · STM32_3

- 과제8: MCU SPI 송신 소스와 SCK/MOSI/CS 실측(0x55/0xA5/0x00/0xFF, 클록·비트 순서).
- 과제9: MCU→MCU 양방향 역할 교대, 수신 UART 값과 배선.
- 과제10: MCU→FPGA, 직접 작성한 SPI 수신 RTL/TB/XDC, 수신 FPGA UART 출력.
- 과제11: FPGA→MCU, 직접 작성한 SPI 마스터 RTL/TB/XDC, 1MHz 이하 파형·MCU 수신 출력.
- 과제12: FPGA→FPGA, 두 역할 교대·수신 UART 출력.
- 결과보고서. MCU–MCU/FPGA–FPGA는 지정 조 연결, MCU–FPGA는 자기 조 장비. 별도 교재 추가실습은 없습니다.
