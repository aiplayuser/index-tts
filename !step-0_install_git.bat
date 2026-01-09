@echo off && chcp 65001
setlocal enabledelayedexpansion
set CURRENT_DIR=%~dp0
set UV_INSTALL_DIR=%CURRENT_DIR%.uv
set UV_CACHE_DIR=%CURRENT_DIR%.uv\uvcache
set UV_PYTHON_INSTALL_DIR=%CURRENT_DIR%.uv\python
set UV_DEFAULT_INDEX=https://mirrors.aliyun.com/pypi/simple/
set HF_ENDPOINT=https://hf-mirror.com
set HF_HOME=%CURRENT_DIR%.uv\hfcache
set PATH=%CURRENT_DIR%.uv;%CURRENT_DIR%.venv\Scripts;%PATH%
set vcurl=https://aka.ms/vs/17/release/vc_redist.x64.exe
set uvurl=https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-pc-windows-msvc.zip
set giturl=https://registry.npmmirror.com/-/binary/git-for-windows/v2.52.0.windows.1/Git-2.52.0-64-bit.exe

echo. && echo ---install git && echo.
(if not exist .git.exe curl -#fL !giturl! -o .git.exe)
.git.exe /SILENT /COMPONENTS="gitlfs,credential-manager" 

pause