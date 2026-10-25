# 정리·누락 점검 기록

대상: YunchanJu/lab4_stm32_0 main, 정리 전 커밋 ebc8fcb5b79e9914d4542d857ef6a9e9e17cbc1f. 점검일 2026-10-26.

- 기존 원격 파일은 로컬 공개용 사본과 Git blob SHA로 대조한 후 이동했습니다.
- 이전 전체 ZIP 안의 Core/Drivers/CMake/IOC/시작 코드/링커 스크립트와 ELF/HEX를 복원했습니다. ZIP 내부에 이미 코드·펌웨어가 있었으므로 새로 발견된 코드로 가장하지 않습니다.
- 실험별 설정 모드 안내와 날짜별 제출 체크리스트를 추가했습니다.
- 10/12 기존 결과보고서·영상 4개·사진 23개를 보존했습니다. 영상 전체 재측정은 수행하지 않았습니다.
- 10/19 첨부 영상 5개·사진 19장과 주요장면 18장을 연결했습니다. 신호등/ADC의 당시 소스·물리 핀은 미확보이며 준비본과 촬영본의 차이를 명시했습니다.
- 10/26 MCU 과제5~7 및 FPGA UART/서보/SRAM/DAC 코드를 준비·검증했습니다. 11/2는 요구사항 안내입니다. 미래 실험 영상이나 계측값을 만들지 않았습니다.
- CMake/VS Code의 특정 PC 절대경로를 제거하고 CLI 모드 override를 추가했습니다. ARM 12개 모드 빌드 및 FPGA 자체 검사 TB 9개를 통과했습니다. 10/26 FPGA 4종은 실제 Vivado GUI XSim에서도 통과했습니다. 실제 보드 다운로드는 수행하지 않습니다.
- 원본 source_code.zip은 촬영 당시 소스와의 관계가 불확실해 archive에 보존했습니다. 과거 전체 ZIP은 커밋 기록에서 복원할 수 있습니다.

## 제거한 중복·불필요 항목

- `STM32/STM32_0/full_project.zip`: Full STM32 sources and firmware expanded; FPGA sources already visible; generated DCPs excluded
- `STM32/STM32_0/SHA256SUMS.txt`: Old package paths obsolete; regenerate final manifest
- `STM32/STM32_1/full_project.zip`: Full STM32 sources and firmware expanded; FPGA sources already visible; generated DCPs excluded
- `STM32/STM32_1/SHA256SUMS.txt`: Old package paths obsolete; regenerate final manifest
- `STM32/STM32_1/mcu/project/Core/Inc/stm32_0_config.h`: Unused prior-week config; routine includes stm32_1_config.h
- `STM32/STM32_1/fpga/01_piano/constraints/clock_only.xdc`: Unused duplicate; create_project.tcl uses piano_board.xdc
- `STM32/STM32_0/evidence/experiment_images.zip`: All 23 images expanded without modification
- `STM32/STM32_0/verification/previous/project_check_22576.backup.log`: Backup build log; primary project_check.log retained
- `STM32/STM32_0/fpga/02_bcd_conv/constraints/pinmap_to_confirm.xdc`: Empty placeholder; complete pins.xdc exists
- `STM32/STM32_0/fpga/01_mult_4bit/constraints/pinmap_to_confirm.xdc`: Empty placeholder; complete pins.xdc exists

## 원본 파일 이동표

| 이전 | 새 경로 |
|---|---|
| `1번임.mp4` | `STM32/STM32_0/fpga/01_mult_4bit/evidence/board_demo.mp4` |
| `2번임.mp4` | `STM32/STM32_0/fpga/02_bcd_conv/evidence/board_demo.mp4` |
| `README.md` | `STM32/STM32_0/archive/original_results_README.md` |
| `STM32_1_1019/OPEN_ITEMS.md` | `STM32/STM32_1/OPEN_ITEMS.md` |
| `STM32_1_1019/README.md` | `STM32/STM32_1/README.md` |
| `STM32_1_1019/VSCode_실행안내.md` | `STM32/STM32_1/mcu/실행안내.md` |
| `STM32_1_1019/fpga/adc/constraints/PORTS_TO_CONNECT.md` | `STM32/STM32_1/fpga/03_adc/constraints/PORTS_TO_CONNECT.md` |
| `STM32_1_1019/fpga/adc/constraints/clock_only.xdc` | `STM32/STM32_1/fpga/03_adc/constraints/clock_only.xdc` |
| `STM32_1_1019/fpga/adc/create_project.tcl` | `STM32/STM32_1/fpga/03_adc/create_project.tcl` |
| `STM32_1_1019/fpga/adc/sim/tb_adc.sv` | `STM32/STM32_1/fpga/03_adc/sim/tb_adc.sv` |
| `STM32_1_1019/fpga/adc/src/adc.v` | `STM32/STM32_1/fpga/03_adc/src/adc.v` |
| `STM32_1_1019/fpga/adc/verification/final.vcd` | `STM32/STM32_1/fpga/03_adc/verification/final.vcd` |
| `STM32_1_1019/fpga/adc/verification/simulate.log` | `STM32/STM32_1/fpga/03_adc/verification/simulate.log` |
| `STM32_1_1019/fpga/adc/verification/synthesis_timing.rpt` | `STM32/STM32_1/fpga/03_adc/verification/synthesis_timing.rpt` |
| `STM32_1_1019/fpga/adc/verification/utilization.rpt` | `STM32/STM32_1/fpga/03_adc/verification/utilization.rpt` |
| `STM32_1_1019/fpga/piano/constraints/PORTS_TO_CONNECT.md` | `STM32/STM32_1/fpga/01_piano/constraints/PORTS_TO_CONNECT.md` |
| `STM32_1_1019/fpga/piano/constraints/piano_board.xdc` | `STM32/STM32_1/fpga/01_piano/constraints/piano_board.xdc` |
| `STM32_1_1019/fpga/piano/create_project.tcl` | `STM32/STM32_1/fpga/01_piano/create_project.tcl` |
| `STM32_1_1019/fpga/piano/piano_board.bit` | `STM32/STM32_1/fpga/01_piano/piano_board.bit` |
| `STM32_1_1019/fpga/piano/sim/tb_piano.sv` | `STM32/STM32_1/fpga/01_piano/sim/tb_piano.sv` |
| `STM32_1_1019/fpga/piano/src/piano.v` | `STM32/STM32_1/fpga/01_piano/src/piano.v` |
| `STM32_1_1019/fpga/piano/src/piano_board.v` | `STM32/STM32_1/fpga/01_piano/src/piano_board.v` |
| `STM32_1_1019/fpga/piano/verification/final.vcd` | `STM32/STM32_1/fpga/01_piano/verification/final.vcd` |
| `STM32_1_1019/fpga/piano/verification/final_drc.rpt` | `STM32/STM32_1/fpga/01_piano/verification/final_drc.rpt` |
| `STM32_1_1019/fpga/piano/verification/final_io.rpt` | `STM32/STM32_1/fpga/01_piano/verification/final_io.rpt` |
| `STM32_1_1019/fpga/piano/verification/routed_timing.rpt` | `STM32/STM32_1/fpga/01_piano/verification/routed_timing.rpt` |
| `STM32_1_1019/fpga/piano/verification/simulate.log` | `STM32/STM32_1/fpga/01_piano/verification/simulate.log` |
| `STM32_1_1019/fpga/piano/verification/synthesis_timing.rpt` | `STM32/STM32_1/fpga/01_piano/verification/synthesis_timing.rpt` |
| `STM32_1_1019/fpga/piano/verification/utilization.rpt` | `STM32/STM32_1/fpga/01_piano/verification/utilization.rpt` |
| `STM32_1_1019/fpga/piano/사용안내.md` | `STM32/STM32_1/fpga/01_piano/사용안내.md` |
| `STM32_1_1019/fpga/traffic/constraints/PORTS_TO_CONNECT.md` | `STM32/STM32_1/fpga/02_traffic/constraints/PORTS_TO_CONNECT.md` |
| `STM32_1_1019/fpga/traffic/constraints/clock_only.xdc` | `STM32/STM32_1/fpga/02_traffic/constraints/clock_only.xdc` |
| `STM32_1_1019/fpga/traffic/create_project.tcl` | `STM32/STM32_1/fpga/02_traffic/create_project.tcl` |
| `STM32_1_1019/fpga/traffic/sim/tb_traffic.sv` | `STM32/STM32_1/fpga/02_traffic/sim/tb_traffic.sv` |
| `STM32_1_1019/fpga/traffic/src/traffic.v` | `STM32/STM32_1/fpga/02_traffic/src/traffic.v` |
| `STM32_1_1019/fpga/traffic/verification/final.vcd` | `STM32/STM32_1/fpga/02_traffic/verification/final.vcd` |
| `STM32_1_1019/fpga/traffic/verification/simulate.log` | `STM32/STM32_1/fpga/02_traffic/verification/simulate.log` |
| `STM32_1_1019/fpga/traffic/verification/synthesis_timing.rpt` | `STM32/STM32_1/fpga/02_traffic/verification/synthesis_timing.rpt` |
| `STM32_1_1019/fpga/traffic/verification/utilization.rpt` | `STM32/STM32_1/fpga/02_traffic/verification/utilization.rpt` |
| `STM32_1_1019/prelab.pdf` | `STM32/STM32_1/reports/prelab.pdf` |
| `STM32_1_1019/stm32_lab/CMakePresets.json` | `STM32/STM32_1/mcu/project/CMakePresets.json` |
| `STM32_1_1019/stm32_lab/Core/Inc/ece2_474.h` | `STM32/STM32_1/mcu/project/Core/Inc/ece2_474.h` |
| `STM32_1_1019/stm32_lab/Core/Inc/main.h` | `STM32/STM32_1/mcu/project/Core/Inc/main.h` |
| `STM32_1_1019/stm32_lab/Core/Inc/stm32_1_config.h` | `STM32/STM32_1/mcu/project/Core/Inc/stm32_1_config.h` |
| `STM32_1_1019/stm32_lab/Core/Src/ece2_474_routine.c` | `STM32/STM32_1/mcu/project/Core/Src/ece2_474_routine.c` |
| `STM32_1_1019/stm32_lab/cmake/gcc-arm-none-eabi.cmake` | `STM32/STM32_1/mcu/project/cmake/gcc-arm-none-eabi.cmake` |
| `STM32_1_1019/stm32_lab/ece2_474.code-workspace` | `STM32/STM32_1/mcu/project/ece2_474.code-workspace` |
| `STM32_1_1019/verification/arm_active_stage5.log` | `STM32/STM32_1/verification/previous/arm_active_stage5.log` |
| `STM32_1_1019/verification/arm_active_task3.log` | `STM32/STM32_1/verification/previous/arm_active_task3.log` |
| `STM32_1_1019/verification/arm_build_summary.json` | `STM32/STM32_1/verification/previous/arm_build_summary.json` |
| `STM32_1_1019/verification/arm_stage1.log` | `STM32/STM32_1/verification/previous/arm_stage1.log` |
| `STM32_1_1019/verification/arm_stage2.log` | `STM32/STM32_1/verification/previous/arm_stage2.log` |
| `STM32_1_1019/verification/arm_stage3.log` | `STM32/STM32_1/verification/previous/arm_stage3.log` |
| `STM32_1_1019/verification/arm_stage4.log` | `STM32/STM32_1/verification/previous/arm_stage4.log` |
| `STM32_1_1019/verification/arm_stage5.log` | `STM32/STM32_1/verification/previous/arm_stage5.log` |
| `STM32_1_1019/verification/cmake_configure.log` | `STM32/STM32_1/verification/previous/cmake_configure.log` |
| `STM32_1_1019/verification/final_status.json` | `STM32/STM32_1/verification/previous/final_status.json` |
| `STM32_1_1019/verification/native_test_summary.json` | `STM32/STM32_1/verification/previous/native_test_summary.json` |
| `STM32_1_1019/verification/size_stage1.log` | `STM32/STM32_1/verification/previous/size_stage1.log` |
| `STM32_1_1019/verification/size_stage2.log` | `STM32/STM32_1/verification/previous/size_stage2.log` |
| `STM32_1_1019/verification/size_stage3.log` | `STM32/STM32_1/verification/previous/size_stage3.log` |
| `STM32_1_1019/verification/size_stage4.log` | `STM32/STM32_1/verification/previous/size_stage4.log` |
| `STM32_1_1019/verification/size_stage5.log` | `STM32/STM32_1/verification/previous/size_stage5.log` |
| `STM32_1_1019/verification/vivado_piano_timing.png` | `STM32/STM32_1/verification/previous/vivado_piano_timing.png` |
| `STM32_1_1019/verification/vscode_build.png` | `STM32/STM32_1/verification/previous/vscode_build.png` |
| `STM32_1_1019/verification/vscode_init.png` | `STM32/STM32_1/verification/previous/vscode_init.png` |
| `STM32_1_1019/측정기록.csv` | `STM32/STM32_1/evidence/measurements.csv` |
| `analyze_led_video.py` | `STM32/STM32_0/analysis/analyze_led_video.py` |
| `led3_brightness.csv` | `STM32/STM32_0/analysis/led3_brightness.csv` |
| `led4_brightness.csv` | `STM32/STM32_0/analysis/led4_brightness.csv` |
| `report.pdf` | `STM32/STM32_0/reports/result.pdf` |
| `source_code.zip` | `STM32/STM32_0/archive/source_code_original.zip` |
| `supplement_1012/README.md` | `STM32/STM32_0/README.md` |
| `supplement_1012/fpga/bcd_conv/bcd_conv.bit` | `STM32/STM32_0/fpga/02_bcd_conv/bcd_conv.bit` |
| `supplement_1012/fpga/bcd_conv/constraints/pins.xdc` | `STM32/STM32_0/fpga/02_bcd_conv/constraints/pins.xdc` |
| `supplement_1012/fpga/bcd_conv/create_project.tcl` | `STM32/STM32_0/fpga/02_bcd_conv/create_project.tcl` |
| `supplement_1012/fpga/bcd_conv/sim/tb_bcd_conv.sv` | `STM32/STM32_0/fpga/02_bcd_conv/sim/tb_bcd_conv.sv` |
| `supplement_1012/fpga/bcd_conv/src/bcd_conv.v` | `STM32/STM32_0/fpga/02_bcd_conv/src/bcd_conv.v` |
| `supplement_1012/fpga/bcd_conv/verification/drc.rpt` | `STM32/STM32_0/fpga/02_bcd_conv/verification/drc.rpt` |
| `supplement_1012/fpga/bcd_conv/verification/timing.rpt` | `STM32/STM32_0/fpga/02_bcd_conv/verification/timing.rpt` |
| `supplement_1012/fpga/bcd_conv/verification/utilization.rpt` | `STM32/STM32_0/fpga/02_bcd_conv/verification/utilization.rpt` |
| `supplement_1012/fpga/mult_4bit/constraints/pins.xdc` | `STM32/STM32_0/fpga/01_mult_4bit/constraints/pins.xdc` |
| `supplement_1012/fpga/mult_4bit/create_project.tcl` | `STM32/STM32_0/fpga/01_mult_4bit/create_project.tcl` |
| `supplement_1012/fpga/mult_4bit/mult_4bit.bit` | `STM32/STM32_0/fpga/01_mult_4bit/mult_4bit.bit` |
| `supplement_1012/fpga/mult_4bit/sim/tb_mult_4bit.sv` | `STM32/STM32_0/fpga/01_mult_4bit/sim/tb_mult_4bit.sv` |
| `supplement_1012/fpga/mult_4bit/src/mult_4bit.v` | `STM32/STM32_0/fpga/01_mult_4bit/src/mult_4bit.v` |
| `supplement_1012/fpga/mult_4bit/verification/drc.rpt` | `STM32/STM32_0/fpga/01_mult_4bit/verification/drc.rpt` |
| `supplement_1012/fpga/mult_4bit/verification/timing.rpt` | `STM32/STM32_0/fpga/01_mult_4bit/verification/timing.rpt` |
| `supplement_1012/fpga/mult_4bit/verification/utilization.rpt` | `STM32/STM32_0/fpga/01_mult_4bit/verification/utilization.rpt` |
| `supplement_1012/stm32_project/CMakePresets.json` | `STM32/STM32_0/mcu/project/CMakePresets.json` |
| `supplement_1012/stm32_project/Core/Inc/ece2_474.h` | `STM32/STM32_0/mcu/project/Core/Inc/ece2_474.h` |
| `supplement_1012/stm32_project/Core/Inc/main.h` | `STM32/STM32_0/mcu/project/Core/Inc/main.h` |
| `supplement_1012/stm32_project/Core/Inc/stm32_0_config.h` | `STM32/STM32_0/mcu/project/Core/Inc/stm32_0_config.h` |
| `supplement_1012/stm32_project/Core/Src/ece2_474_routine.c` | `STM32/STM32_0/mcu/project/Core/Src/ece2_474_routine.c` |
| `supplement_1012/stm32_project/cmake/gcc-arm-none-eabi.cmake` | `STM32/STM32_0/mcu/project/cmake/gcc-arm-none-eabi.cmake` |
| `supplement_1012/stm32_project/ece2_474.code-workspace` | `STM32/STM32_0/mcu/project/ece2_474.code-workspace` |
| `supplement_1012/verification/active_stage1.log` | `STM32/STM32_0/verification/previous/active_stage1.log` |
| `supplement_1012/verification/build_tools.json` | `STM32/STM32_0/verification/previous/build_tools.json` |
| `supplement_1012/verification/configure.log` | `STM32/STM32_0/verification/previous/configure.log` |
| `supplement_1012/verification/firmware_checks.json` | `STM32/STM32_0/verification/previous/firmware_checks.json` |
| `supplement_1012/verification/project_check.log` | `STM32/STM32_0/verification/previous/project_check.log` |
| `supplement_1012/verification/stage1.log` | `STM32/STM32_0/verification/previous/stage1.log` |
| `supplement_1012/verification/stage2.log` | `STM32/STM32_0/verification/previous/stage2.log` |
| `supplement_1012/verification/stage3.log` | `STM32/STM32_0/verification/previous/stage3.log` |
| `supplement_1012/verification/stage4.log` | `STM32/STM32_0/verification/previous/stage4.log` |
| `supplement_1012/verification/vivado_prepare.log` | `STM32/STM32_0/verification/previous/vivado_prepare.log` |
| `supplement_1012/verification/xelab.log` | `STM32/STM32_0/verification/previous/xelab.log` |
| `supplement_1012/verification/xsim.log` | `STM32/STM32_0/verification/previous/xsim.log` |
| `supplement_1012/verification/xvlog.log` | `STM32/STM32_0/verification/previous/xvlog.log` |
| `과제1.mp4` | `STM32/STM32_0/mcu/03_task1_internal_led/evidence/board_demo.mp4` |
| `과제2.mp4` | `STM32/STM32_0/mcu/04_task2_external_led/evidence/board_demo.mp4` |
