@echo off
title Skynet Taskboard Server
cd /d C:\Users\Skynet\.openclaw\workspace
echo Starting Skynet Taskboard on http://localhost:8888 ...
npx http-server -p 8888 --cors -c-1 -s
