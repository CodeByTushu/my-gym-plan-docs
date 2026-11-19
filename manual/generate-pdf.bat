@echo off
echo ========================================================
echo  Generating My GYM Plan Interactive PDF Documentation...
echo ========================================================
set EDGE_PATH="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if not exist %EDGE_PATH% set EDGE_PATH="C:\Program Files\Microsoft\Edge\Application\msedge.exe"

set HTML_PATH="%~dp0My-Gym-Plan-Athletic-Manual.html"
set PDF_PATH="%~dp0My-Gym-Plan-Athletic-Manual.pdf"

if not exist %EDGE_PATH% (
    echo [NOTICE] Microsoft Edge executable not found at default path.
    echo Please open My-Gym-Plan-Athletic-Manual.html in any browser and press Ctrl+P -> 'Save as PDF'.
    pause
    exit /b 1
)

%EDGE_PATH% --headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf=%PDF_PATH% %HTML_PATH%

if exist %PDF_PATH% (
    echo [SUCCESS] PDF generated successfully!
    echo Output: %PDF_PATH%
) else (
    echo [TIP] You can also open My-Gym-Plan-Athletic-Manual.html in Chrome or Edge,
    echo press Ctrl+P, select Destination: 'Save as PDF', and click Save!
)
pause
