@echo on

set current_dir=%cd%
set script_dir=%~dp0
set project_dir=%script_dir%.
set reports_dir=%project_dir%\..\reports\chrome

del /f /s /q "%reports_dir%"
rmdir /s /q "%reports_dir%"
mkdir "%reports_dir%"

docker run -t --rm -v "%project_dir%":/katalon/katalon/source -v "%reports_dir%":/katalon/katalon/report katalonstudio/katalon:test katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"

cd "%current_dir%"
