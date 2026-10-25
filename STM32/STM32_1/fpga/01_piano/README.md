# 피아노

- src/: Verilog 회로. sim/: 자체 검사 테스트벤치.
- constraints/: 보드 핀 설정.
- create_project.tcl: Vivado Tcl Console에서 `source <이 폴더>/create_project.tcl`로 재생성. 최상위 piano_board.
- simulate.tcl: 콘솔에서 source하면 TB tb_piano를 끝까지 실행합니다. 실패 시 Tcl 오류가 발생합니다.
- verification/: 보관된 과거 결과. verification/recheck_20261026/: 이번 재검증 결과가 있으면 보관.

[실제 보드영상](evidence/board_demo.mp4)과 실험 당시 캡처 4장을 evidence에 보관했습니다. 원본 프로젝트는 다른 PC에서 실행했고 준비 소스와의 동일성은 미확인입니다.

bit 파일이 있어도 실제 보드 동작 검증과 구분합니다.
