# 🤖 Kanban Taskbar

AI Agent Task Manager — OpenClaw Gateway üzerinden AI modellerini yöneten Kanban board.

## Features
- 🎯 Drag & drop Kanban board (Backlog → In Progress → Review → Done)
- 🚀 Multi-model parallel deploy (DeepSeek, Kimi, Sonnet, Opus, Qwen, Groq)
- ⚡ Real-time WebSocket connection to OpenClaw Gateway
- 🛑 Abort running agents to save tokens
- 💡 Scratch Pad for brainstorming
- 🔍 Search & filter tasks
- 🌙 Dark theme
- 💾 localStorage persistence
- 📦 Single HTML file — no backend needed

## Setup
1. Clone this repo
2. Set your Gateway token in `index.html` (`GW_TOKEN`)
3. Run: `npx http-server -p 8888 --cors -c-1`
4. Open: `http://localhost:8888`

## Auto-Start (Windows)
- `skynet-taskboard.vbs` — Hidden server + browser auto-open
- `start-taskboard.bat` — Manual start with console
- Copy `.vbs` to Windows Startup folder for boot auto-start

## Requirements
- [OpenClaw](https://github.com/openclaw/openclaw) Gateway running on `ws://127.0.0.1:18789`
- Node.js (for http-server)

## Tech
- Single HTML file (~50KB)
- Pure vanilla JS — no frameworks
- WebSocket Gateway protocol v3
- Turkish UI labels

## License
MIT
