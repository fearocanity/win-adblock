@echo off
setlocal enabledelayedexpansion

echo Available Adapters are:
set count=0
for /f "tokens=2,* delims=: " %%a in ('ipconfig /all ^| find "adapter"') do (
	set /a count+=1
	set input=%%b
	set output=!input:adapter =!
	set output=!output:adapter =!
	set output=!output::=!
	echo !count!. !output!
)

set /p choice=Enter the adapter number:

if "%choice%"=="" (
	echo Invalid choice. Exiting...
	exit /b 1
)

set valid=false
for /f "tokens=2,* delims=: " %%a in ('ipconfig /all ^| find "adapter"') do (
	set /a counter+=1
	if "!counter!"=="%choice%" (
		set input=%%b
		set output=!input:adapter =!
		set output=!output:adapter =!
		set output=!output::=!
		set adapterName=!output!
		set valid=true
		goto :break
	)
)

:break

if not %valid%==true (
	echo Invalid choice. Exiting...
	exit /b 1
)

echo Backing up previous DNS server settings...
netsh interface ipv4 show dns "%adapterName%" > %TEMP%\dns_backup.txt

for /f "skip=2 tokens=1,2" %%a in (%TEMP%\dns_backup.txt) do (
	echo DNS server %%a: %%b >> %USERPROFILE%\Desktop\dns_backup.txt
)

REM Set the vars to Adguard DNS
set dnsServer1="94.140.14.14"
set dnsServer2="94.140.15.15"

netsh interface ipv4 set dns "%adapterName%" static "%dnsServer1%" primary
netsh interface ipv4 add dns "%adapterName%" "%dnsServer2%" index=2

echo DNS server settings changed to:
netsh interface ipv4 show dns "%adapterName%"
echo DNS server settings changed successfully.

del %TEMP%\dns_backup.txt

echo "Previous DNS server settings backed up to: %USERPROFILE%\Desktop\dns_backup.txt"