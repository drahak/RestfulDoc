@echo off

REM Windows script for running end-to-end tests

set BASE_DIR=%~dp0
karma start "%BASE_DIR%\..\config\karma-e2e.js" %*