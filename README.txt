=========================================
Ready Set Bet Companion (오프라인 패키지)
=========================================

이 폴더는 인터넷 연결 없이도 Ready 시 Bet 컴패니언 앱을 실행할 수 있도록 구성된 오프라인 전용 패키지입니다.
Electron과 같은 무거운 런타임 없이, 이미 설치된 Chrome이나 Edge 브라우저를 활용하여 구동 속도를 극대화했습니다.

[ 파일 구조 ]
  index.html
  Build/
  TemplateData/
  server.ps1 (Windows용 로컬 서버 모듈)
  play.bat / play-server.bat (Windows 실행)
  play.command / play-server.command (macOS 실행)

[ Windows 사용 방법 ]
1. "play.bat" 파일을 더블 클릭하여 실행합니다.
2. 만약 검은 화면만 뜨거나 정상적으로 로딩되지 않는다면, "play-server.bat"을 대신 실행해 보세요.
  * play-server.bat은 내부적으로 "server.ps1"을 호출하여 빈 포트(8000~8010)를 자동으로 찾아 로컬 서버를 열어줍니다. 서버는 게임을 끄면 깔끔하게 같이 종료됩니다.

[ macOS 사용 방법 ]
1. "play.command" 파일을 우클릭하고 '열기'를 클릭하여 실행합니다. (보안 경고 시 다시 '열기' 클릭)
2. 만약 검은 화면만 뜨거나 정상적으로 로딩되지 않는다면, "play-server.command"를 대신 실행해 보세요.
  * play-server.command는 Mac에 내장된 Python3나 Ruby 중 존재하는 것을 감지하여 빈 포트(8000~8010)를 찾아 로컬 서버를 열어줍니다. 게임을 끄면 서버 프로세스도 안전하게 종료됩니다.

* 참고 1: macOS 터미널에서 권한 거부(Permission Denied) 에러가 발생할 경우, 터미널을 열고 아래 명령어를 입력해 실행 권한을 부여하세요.
  chmod +x play.command play-server.command
* 참고 2: 다운로드 받은 파일이라 macOS 환경에서 '실행할 수 없음' 또는 손상 오류로 차단되는 경우, 터미널에서 다음 명령어로 격리 속성(Quarantine)을 완전히 해제할 수 있습니다.
  xattr -dr com.apple.quarantine "/현재/폴더/경로"

[ 주의 사항 ]
- 실행 시 폴더 안에 "browser-profile" 이라는 폴더가 생성됩니다. 이는 게임 진행 상황(IndexedDB 캐시 등)이 저장되는 전용 장소입니다. 이 폴더를 지우면 진행 상황이 초기화되니 주의하세요.
- 이 패키지는 오프라인(로컬 파일) 상태로 동작합니다. 따라서 네트워크가 차단된 상태에서도 실행이 가능합니다.
- 처음 실행 시에는 파일(.wasm 등)을 읽고 파싱하느라 시간이 약간 소요될 수 있으나, 두 번째 실행부터는 "browser-profile"에 캐시가 저장되어 훨씬 빠르게 로딩됩니다.
- 본 프로그램은 팬메이드 목적으로 원본 소스를 패키징한 것이며, 모든 저작권은 AEG 및 Nomad Games에 있습니다.
