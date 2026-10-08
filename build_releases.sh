#!/bin/bash
set -e

# Define mapping: bundle_prefix:locale_json:FriendlyName
LANGS=(
    "krkr:kr-KR:Korean"
    "esmx:es-MX:Spanish_MX"
    "huhu:hu-HU:Hungarian"
    "dede:de-DE:German"
    "zhcn:zh-CN:Chinese_Simplified"
    "jajp:ja-JP:Japanese"
    "elgr:el-GR:Greek"
    "cscz:cs-CZ:Czech"
    "frfr:fr-FR:French"
    "zhtw:zh-TW:Chinese_Traditional"
    "ruru:ru-RU:Russian"
    "plpl:pl-PL:Polish"
)

# Delete existing release
gh release delete latest --cleanup-tag -y || true
gh release create latest -t "Latest Offline Packages" -n "이 릴리즈는 완벽하게 무설치 환경에서 구동되는 오프라인 전용 패키지입니다. 용량 절약을 위해 언어별로 별도 압축되어 있습니다. 원하시는 언어의 압축 파일을 다운로드하여 실행하세요. (모든 패키지에는 기본적으로 영어가 포함되어 있습니다.)"

# Prepare staging area
rm -rf /tmp/staging
mkdir -p /tmp/staging/StreamingAssets/WebGL
mkdir -p /tmp/staging/StreamingAssets/Locale

# 1. English Only Package
echo "Building English_Only..."
cp -r Build TemplateData server.ps1 play.bat play.command index.html LICENSE README.md play-server.bat play-server.command /tmp/staging/

# Copy generic bundles
find StreamingAssets/WebGL/ -maxdepth 1 -type f | grep -E -v '(/cscz|/dede|/elgr|/engb|/esmx|/frfr|/huhu|/jajp|/krkr|/plpl|/ruru|/zhcn|/zhtw)' | xargs -I {} cp {} /tmp/staging/StreamingAssets/WebGL/

# Copy English bundles
cp StreamingAssets/WebGL/engb* /tmp/staging/StreamingAssets/WebGL/
cp StreamingAssets/Locale/en-GB.json /tmp/staging/StreamingAssets/Locale/

cd /tmp/staging
zip -r /tmp/ReadySetBet_Offline_English_Only.zip . >/dev/null
cd - >/dev/null

echo "Uploading English_Only..."
gh release upload latest /tmp/ReadySetBet_Offline_English_Only.zip

# 2. Other Languages
for lang_info in "${LANGS[@]}"; do
    IFS=':' read -r prefix locale name <<< "$lang_info"
    echo "Building $name ($prefix)..."
    
    # We already have base + generic + English in /tmp/staging
    # Just copy the specific language files, zip, then remove them for the next iteration!
    cp StreamingAssets/WebGL/${prefix}* /tmp/staging/StreamingAssets/WebGL/
    cp StreamingAssets/Locale/${locale}.json /tmp/staging/StreamingAssets/Locale/
    
    cd /tmp/staging
    zip -r /tmp/ReadySetBet_Offline_${name}.zip . >/dev/null
    cd - >/dev/null
    
    echo "Uploading $name..."
    gh release upload latest /tmp/ReadySetBet_Offline_${name}.zip
    
    # Clean up the specific language files
    rm /tmp/staging/StreamingAssets/WebGL/${prefix}*
    rm /tmp/staging/StreamingAssets/Locale/${locale}.json
done

echo "All releases uploaded!"
