@echo off

:ask
@echo Are you sure you want to stop and remove ALL Docker images and containers? [Y/N]?
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yes 
If /I "%INPUT%"=="n" goto no
goto ask

:yes
@echo Deleting all Docker images/containers...
FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker stop %%i
FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker rm %%i
FOR /f "tokens=*" %%i IN ('docker images --format "{{.ID}}"') DO docker rmi -f %%i
goto exit

:no
@echo Ok, we'll stop.
goto exit

:exit
@echo Exiting...