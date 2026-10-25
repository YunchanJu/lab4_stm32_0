# STM32_2 PC I/O and UART

Open ece2_474.code-workspace in VS Code. Select STM32_2_STAGE=5/6/7 in Core/Inc/stm32_2_config.h, or configure CMake with -DSTM32_STAGE=5/6/7. A cached override takes precedence over the header. ARM GCC, CMake and Ninja must be available on PATH.

Task5 prints character and hex value via UART2 VCP. Tasks6 and 7 forward the same byte on UART3 PC10 TX. Use two PC serial monitors: MCU VCP and FPGA USB UART. 9600 8N1, line ending None. Connect common GND. The MCU has no XDC.

Initial mode 5. No hardware result is claimed. Build with cmake --preset Debug and cmake --build --preset Debug, then download through ST-Link.
