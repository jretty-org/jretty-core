@echo off
setlocal

echo.
call java -version
echo.
SET JAVA_HOME=D:\C\Program Files\Java\jdk1.7.0_80
echo ------------------------- maven info -------------------------------
call mvn -v

if [%1]==[] goto HELP
if [%1]==[--help] goto HELP
if [%1]==[install] goto INSTALL
if [%1]==[deploy] goto DEPLOY
goto HELP
:: ****************************************************************************
:: Title :  xxxxx                                                        
:: 
:: Usage :  xxxxx                                                    
:: 
:: Args  :  xxxxx            
:: 
:: E.g.  :                                                               
:: 
:: Notes :                                                               
:: 
:: Requires: 
:: 
:: Returns:  
:: 
:: Author:   Zollty Tsou                                                      *
:: Version:  1.0.0                                                            *
:: Date:     02/28/2018                                                       *
:: Link:     zollty@163.com                                                   *
:: ****************************************************************************

:: add "-Pjretty-doc" to generate java docs

:INSTALL
echo ------------------------- starting to install -------------------------
call mvn clean install -pl jretty-core -Pjretty-release

goto EOF

:DEPLOY
echo ------------------------- starting to deploy -------------------------
call mvn clean deploy -pl jretty-core -Pjretty-release -Plocal-deploy

goto EOF

:HELP
echo.
echo Usage: 
echo    input 'deploy' to deploy to local repo.
echo    input 'install' to execute install.
echo.
:EOF