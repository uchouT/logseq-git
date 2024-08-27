@echo off
setlocal

:: 自定义本地仓库路径
set LOCAL_REPO_PATH=E:\Document\logseq

:: 显示菜单
echo Choose an option:
echo 1. Force push local changes to remote repository
echo 2. Force pull from remote repository and overwrite local changes
set /p choice=Enter choice (1 or 2): 

:: 切换到本地仓库目录
cd /d %LOCAL_REPO_PATH%

:: 根据选择执行操作
if "%choice%"=="1" (
    echo Performing force push to remote repository...
    git add -A
    git commit -m "Forced commit to remote from PC"
    git push --force
    echo Force push complete.
) else if "%choice%"=="2" (
    echo Performing force pull from remote repository...
    git fetch origin
    git reset --hard origin/main
    echo Force pull complete.
) else (
    echo Invalid choice. Please enter 1 or 2.
)

endlocal
pause
