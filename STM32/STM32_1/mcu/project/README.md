# STM32_1 STM32 project

Open `ece2_474.code-workspace` in VS Code. Install the STM32 extension and provide ARM GCC, CMake and Ninja on PATH (or use the extension tool bundles). No author-specific absolute tool paths are required.

Select the mode in `Core/Inc/stm32_1_config.h`, save, Build, then download with ST-Link. A successful build does not demonstrate board operation.

CLI: `cmake --preset Debug -DSTM32_STAGE=3`, then `cmake --build --preset Debug`. Changing the cached override takes precedence over the header; remove it with `cmake --preset Debug -USTM32_STAGE` to return to header selection.

Core, Drivers, startup assembly, linker script, IOC and CMake sources were restored from the full project ZIP already published in this repository. Driver license notices remain intact. Historical firmware is in `../firmware`; it is not evidence of the exact binary used in earlier videos.
