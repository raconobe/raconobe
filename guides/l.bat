@echo off
set /p USERNAME="Enter your GitHub Username: "
set /p REPO_NAME="Enter your Repository Name: "

git init
git branch -M main
git remote add origin https://github.com/%USERNAME%/%REPO_NAME%.git
git add .
git commit -m "Initial commit"

echo.
echo Git repository initialized successfully!
pause