Set WshShell = CreateObject("WScript.Shell")
' Start http-server hidden (no window)
WshShell.Run "cmd /c cd /d C:\Users\Skynet\.openclaw\workspace && npx http-server -p 8888 --cors -c-1 -s", 0, False
' Wait 2 seconds for server to start
WScript.Sleep 2000
' Open taskboard in default browser
WshShell.Run "http://localhost:8888/skynet-taskboard.html"
