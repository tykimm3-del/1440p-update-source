# Xbox Korean 1440p v1.1.0 재구성 소스

이 소스는 Green-NX v1.0.22를 기준으로 이전 완성판의 기능을 다시 적용한 버전입니다.

포함 기능:
- 한국어 UI
- 표시 이름 Xbox 및 Xbox 로고
- `/switch/xbox` 데이터 경로
- 기본 배경 + 사용자 배경 10개 선택
- 라이브러리 상단 게이머태그 숨김
- 설정 화면 제작자 표기
- 기존 Title ID `0100A5B0C0DE0000`
- 버전 `1.1.0`
- 실험적 `1440p` 및 `1440p HQ` 요청 옵션

## GitHub Actions

Actions에서 `Build Xbox Korean 1440p Update Inputs`를 실행하세요.
결과 Artifact는 `xbox-ko-1440p-v1.1.0-update-inputs`입니다.

Artifact 안의 `Xbox-1.1.0-1440p.nro`로 기능을 먼저 시험할 수 있습니다.
NSP 입력물은 기존과 같은 Title ID를 사용하므로 기존 설치본 위에 덮어쓰기 위한 구성입니다.

주의: 1440p는 서버에 요청하는 실험 옵션입니다. 실제 수신 해상도는 서버가 1080p 이하로 낮출 수 있습니다.
