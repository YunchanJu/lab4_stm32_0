# STM32_0 10월 12일 결과 자료

[결과레포트 PDF](report.pdf) · [제출 버전](https://github.com/YunchanJu/lab4_stm32_0/releases/tag/stm32-0-results-v1)

주윤찬 / 전자전기컴퓨터설계실험Ⅱ / 실험일 2026-10-12

## 항목과 증거 대응
- 과제1.mp4: STM32 내장 LED의 1→2→4→8→1초 상태 전환 간격
- 과제2.mp4: 외부 LED에서 같은 간격 순환
- 1번임.mp4: 추가실험1 4비트 곱셈기 보드 시연
- 2번임.mp4: 추가실험2 BCD→이진수 변환 보드 시연
- experiment_images.zip: 첨부한 원본 이미지 23개, 첨부 순서 그대로 01-23.png
- source_code.zip: 기존 실험 준비 폴더에서 수집한 STM32 프로젝트와 FPGA RTL·TB·XDC

## 사진 번호
01-05는 4주 계획과 공통 지침, 06-08은 곱셈기, 09-13은 BCD 변환기(11과12 중복), 14는 곱셈기 다운로드, 15는 BCD 다운로드, 16은 직렬 출력, 17-22는 10/12 과제 매뉴얼, 23은 보고서 작성 요령이다.

## 검증 범위
곱셈기 첨부 PASS 로그: 256개 조합. BCD 첨부 PASS 로그: 유효100개·무효156개 입력. 이번 보고서 작성 중 FPGA 보드의 다운로드나 시뮬레이션을 새로 수행하지 않았다. 보관된 코드와 촬영 시점의 바이너리가 동일하다는 해시 대조 자료는 없다. source_code.zip은 보관된 소스 버전이며, 영상에서 읽기 어려운 DIP 입력을 추측해 실측값으로 쓰지 않았다.

## 영상 시간 분석
과제 영상의 10 fps RGB 프레임에서 내장 녹색 LED/외부 적색 LED의 밝기 변화를 추출하였다. 카메라 이동과 손 가림이 있는 초기 구간은 대표 측정에서 제외하였다. 표본 간격은0.1초이며 전기적 정밀 측정은 아니다. led3_brightness.csv와 led4_brightness.csv에 점수 시계열을 보관한다.

## 소스 인용
수업 매뉴얼: https://github.com/thechef030/STM32_1/blob/stm32-1/docs/STM32_0.md
FPGA 소스 설명: https://github.com/thechef030/STM32_1/blob/stm32-1/docs/FPGA_additional.md
ST UM2505: https://www.st.com/resource/en/user_manual/um2505-stm32g4-nucleo64-boards-mb1367-stmicroelectronics.pdf

제출용 태그: `stm32-0-results-v1`

## LED 영상 재분석
Python과 Pillow 및 FFmpeg가 필요합니다.
```sh
python analyze_led_video.py 과제1.mp4 led3_brightness.csv --mode internal
python analyze_led_video.py 과제2.mp4 led4_brightness.csv --mode external
```
내장 LED ROI는 이 촬영 영상의 좌표를 사용하므로 다른 촬영에는 조정해야 합니다. 점등 판단은 내장5/10픽셀, 외부30/60픽셀 임계값에서 대표 전환 시각이 동일함을 확인했습니다. 10fps 3개 연속 표본의 상태가 같은 전환을 대표값으로 사용하고 손 가림 구간은 제외했습니다.

추가 참고 교재: Harris and Harris, Digital Design and Computer Architecture ARM Edition, 2015, ISBN 9780128000564. https://www.sciencedirect.com/book/monograph/9780128000564/digital-design-and-computer-architecture


