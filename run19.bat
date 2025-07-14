@echo off
rem Run B4J Java jar application with all modules
rem Can run javafx applications (JDK must be > 8), tested with JDK19
rem Change the var pgm to run any other jar applicaton
rem javaw is used to run the application
rem See www.b4x.com/b4j.html which Java JHDK version is supported
rem 20250714 rwbl

rem define local vars
rem Set the name of the application (without .jar)
set pgm=ccudeviceviewer
rem Set path to Java JDK 
set jdkpath=c:\prog\jdk19

rem inform
echo Running Java %pgm%
echo Loading...

cd src\Objects
start "%pgm%" %jdkpath%\bin\javaw.exe --module-path %jdkpath%\javafx\lib --add-modules ALL-MODULE-PATH -Dsun.java2d.uiScale=1 -jar %pgm%.jar

echo "Done"

exit

