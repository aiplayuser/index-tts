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

echo. && echo ---install VC && echo.
(if not exist .vc.exe curl -#fL !vcurl! -o .vc.exe)
.vc.exe /passive /norestart

echo. && echo ---install uv && echo.
(if not exist .uv.zip curl -#fL %uvurl% -o .uv.zip)
mkdir .uv & tar -xvf .uv.zip -C .uv

echo. && echo ---uv sync && echo.
uv venv --allow-existing --seed -p 3.10
git lfs install & git lfs pull & uv sync --extra webui

echo. && echo ---hf download && echo. 
modelscope download --model IndexTeam/IndexTTS-2 --local_dir checkpoints

pause