@echo off
setlocal
set "GRADLE_VERSION=8.13"
set "GRADLE_CACHE_DIR=%USERPROFILE%\.gradle\engwe-wrapper"
set "GRADLE_HOME_DIR=%GRADLE_CACHE_DIR%\gradle-%GRADLE_VERSION%"

if not exist "%GRADLE_HOME_DIR%\bin\gradle.bat" (
  if not exist "%GRADLE_CACHE_DIR%" mkdir "%GRADLE_CACHE_DIR%"
  set "GRADLE_ARCHIVE=%GRADLE_CACHE_DIR%\gradle-%GRADLE_VERSION%-bin.zip"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%GRADLE_CACHE_DIR%\gradle-%GRADLE_VERSION%-bin.zip'; Expand-Archive -LiteralPath '%GRADLE_CACHE_DIR%\gradle-%GRADLE_VERSION%-bin.zip' -DestinationPath '%GRADLE_CACHE_DIR%' -Force; Remove-Item '%GRADLE_CACHE_DIR%\gradle-%GRADLE_VERSION%-bin.zip'"
  if errorlevel 1 exit /b 1
)

call "%GRADLE_HOME_DIR%\bin\gradle.bat" %*
exit /b %errorlevel%
