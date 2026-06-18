@echo off
setlocal enabledelayedexpansion

echo Compiling Vulkan shaders...
echo.

:: 切换到脚本所在目录
cd /d "%~dp0"

set SHADER_DIR=.\shaders

:: 检查着色器目录是否存在
if not exist "%SHADER_DIR%" (
    echo [ERROR] Shader directory not found: %SHADER_DIR%
    pause
    exit /b 1
)

set COUNT=0

:: 递归遍历所有着色器文件
for /r "%SHADER_DIR%" %%f in (*.vert *.frag *.comp *.geom *.tesc *.tese) do (
    echo Compiling %%f ...

    :: 进入文件所在目录，避免绝对路径中的冒号问题
    pushd "%%~dpf"

    :: 只使用文件名（不含路径）编译，输出同样加 .spv
    glslc "%%~nxf" -o "%%~nxf.spv"

    if errorlevel 1 (
        echo [ERROR] Failed to compile %%~nxf
    ) else (
        echo [OK] %%~nxf -^> %%~nxf.spv
        set /a COUNT+=1
    )

    :: 返回原目录
    popd
)

echo.
echo Total compiled: %COUNT% files.
pause