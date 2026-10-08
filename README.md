# Ready Set Bet Companion - Offline Archive

[🇰🇷 한국어 설명은 아래에 있습니다](#-한국어-설명-korean)

## 📦 About This Project
This repository is an **offline archive** of the official [Ready Set Bet Companion App](https://nomadgames.co.uk/readysetbet). 
As web-based apps can be taken down or become inaccessible over time, this package is designed to preserve the functionality of the application completely offline, requiring no internet connection or installation.

## ⚖️ Copyright Disclaimer
**This is NOT a fan-made application.** 
All assets, source code, designs, and audio files belong exclusively to **Alderac Entertainment Group (AEG)** and **Nomad Games**.
This repository was created strictly for **archival, preservation, and personal offline use**. It is not intended for commercial distribution. If you are the copyright holder and wish for this archive to be removed, please open an issue and it will be taken down immediately.

## 💾 Download Options
There are two ways to download this archive:
- **Language-Specific Packages (Recommended)**: Go to the **Releases** tab to download a lightweight ZIP file (~270MB) containing only your preferred language and English.
- **Full Master Archive**: If you want to seamlessly switch between all 14 available languages offline, simply `git clone` this repository or click the green **Code -> Download ZIP** button. This will download the entire 500MB archive containing all language voice packs and assets.

## 🚀 How to Run (Windows)
1. Download the language package of your choice from the **Releases** tab and extract the ZIP file.
2. Double-click **`play.bat`** to run the app.
3. *Troubleshooting*: If you experience missing sound or audio issues, try right-clicking `play.bat` and selecting **"Run as Administrator"**. Some browsers block local audio playback due to strict security policies, which administrator privileges can bypass.

## 🍎 How to Run (macOS)
1. Download the language package of your choice from the **Releases** tab and extract the ZIP file.
2. Right-click **`play.command`** and select **"Open"**.
3. *Troubleshooting*: If you encounter a "Permission Denied" error, open your Terminal and run the following command to grant execution rights:
   ```bash
   chmod +x play.command
   ```
   If macOS blocks the app as "damaged" or "cannot be opened", use this command to clear the quarantine flag:
   ```bash
   xattr -dr com.apple.quarantine "/path/to/extracted/folder"
   ```

## ⚠️ Notes
- A `browser-profile` folder will be created automatically when you run the app. This is where your game settings and offline cache are saved. Do not delete this folder unless you want to reset your data.

---

# 🇰🇷 한국어 설명 (Korean)

## 📦 프로젝트 소개
이 저장소는 [Ready Set Bet 컴패니언 앱](https://nomadgames.co.uk/readysetbet)의 **공식 웹 버전을 보존하기 위한 오프라인 아카이브**입니다. (팬메이드 앱이 아닙니다.)
웹 기반 애플리케이션은 서버가 종료되거나 인터넷이 없는 환경에서는 사용할 수 없게 되는 문제가 있어, 어떠한 설치나 인터넷 연결 없이도 영구적으로 구동할 수 있도록 보존 패키지로 구성되었습니다.

## ⚖️ 저작권 및 면책 조항
본 패키지에 포함된 모든 그래픽 에셋, 소스 코드, 디자인, 오디오 파일의 저작권은 **Alderac Entertainment Group (AEG)** 및 **Nomad Games**에 귀속됩니다. 
이 저장소는 상업적 목적이 전혀 없으며, 오로지 **개인적인 오프라인 사용 및 아카이브(보존) 목적**으로만 제작되었습니다. 원 저작권자가 삭제를 요청할 경우 즉각 조치하겠습니다.

## 💾 다운로드 안내
사용 목적에 따라 두 가지 방법으로 다운로드하실 수 있습니다:
- **언어별 패키지 다운로드 (권장)**: **Releases** 탭에 가시면 한국어, 영어 등 원하시는 언어만 포함된 가벼운 개별 압축 파일(~270MB)을 받으실 수 있습니다.
- **전체 마스터 아카이브 다운로드**: 게임 내 설정 창에서 14개국 언어를 자유롭게 변경하며 플레이하고 싶으시다면, 터미널에서 `git clone`을 하시거나 GitHub의 초록색 **Code -> Download ZIP** 버튼을 눌러 소스코드 전체를 통째로 다운로드하세요. 이 저장소에는 14개국의 모든 언어팩과 음성 데이터(약 500MB)가 하나도 빠짐없이 보존되어 있습니다.

## 🚀 Windows 사용 방법
1. **Releases** 탭에서 원하시는 언어의 압축 파일을 다운로드 후 압축을 풉니다.
2. 폴더 내의 **`play.bat`** 파일을 더블클릭하여 실행합니다.
3. *문제 해결*: 만약 화면은 잘 나오는데 **소리가 들리지 않는다면**, `play.bat` 파일을 우클릭하여 **'관리자 권한으로 실행'**해 보세요. 크롬이나 엣지 등 브라우저의 로컬 파일 보안 정책으로 인해 소리가 차단되는 현상을 해결할 수 있습니다.

## 🍎 macOS 사용 방법
1. **Releases** 탭에서 원하시는 언어의 압축 파일을 다운로드 후 압축을 풉니다.
2. **`play.command`** 파일을 우클릭하고 **'열기'**를 클릭하여 실행합니다. (보안 경고가 나타나면 다시 '열기'를 클릭하세요.)
3. *문제 해결*: 터미널에서 권한 거부(Permission Denied) 에러가 발생할 경우, 터미널을 열고 아래 명령어를 입력해 실행 권한을 부여하세요.
   ```bash
   chmod +x play.command
   ```
   만약 macOS 보안에 의해 파일이 손상되었다며 실행이 차단되는 경우, 터미널에서 아래 명령어로 격리 속성(Quarantine)을 해제할 수 있습니다.
   ```bash
   xattr -dr com.apple.quarantine "/압축을/푼/폴더/경로"
   ```

## ⚠️ 주의 사항
- 실행 시 폴더 안에 `browser-profile` 이라는 폴더가 생성됩니다. 이곳에 게임 설정 데이터나 캐시가 저장되므로, 진행 상황을 초기화하려는 게 아니라면 이 폴더를 삭제하지 마세요.
