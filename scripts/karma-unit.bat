@echo off

REM Windows script for running unit tests

set BASE_DIR=%~dp0
karma start "%BASE_DIR%\..\config\karma-unit.js" %*