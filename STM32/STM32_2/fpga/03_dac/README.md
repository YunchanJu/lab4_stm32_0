# dac 사전 준비

교안 FPGA_additional.md의 설계 모듈과 자체 검사 TB를 프로젝트로 구성했습니다. 원문: https://github.com/thechef030/STM32_0/blob/stm32-0/docs/FPGA_additional.md

Vivado에서 create_project.tcl을 source하여 프로젝트를 만들고 Run Behavioral Simulation을 실행합니다. 최상위 dac, TB tb_dac.

현재 XDC는 물리 핀맵을 가정하지 않습니다. 실제 장치의 핀·극성·타이밍과 서보 전원, SRAM 접근 시간, DAC 쓰기 폭은 확인 후 제약을 완성해야 합니다. TB 통과는 실제 아날로그 출력이나 보드 동작 성공이 아닙니다.
