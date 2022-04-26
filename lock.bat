rem file name save as .bat extention
rem commetn lines (rem-print on exicution or ::-don't print)
:: this file used for folder lock
@ECHO OFF
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Secure goto MDSecure
:CONFIRM
echo Do You Want to Protect Secure Folder? (Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren Secure "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Secure Folder Protected
goto End
:UNLOCK
echo Enter password to Unlock Secure Folder
set/p "pass=>"
if NOT %pass%== janvi goto FAIL :: your password
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Secure
echo Secure Folder Unlocked
goto End
:FAIL
echo Invalid password
goto end
:MDSecure
md Secure
echo Secure Folder created successfully
goto End
:End