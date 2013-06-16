set BASE_DIR=%~dp0

cd /d %BASE_DIR%..\
npm install --safe-dev & bower install --dev
