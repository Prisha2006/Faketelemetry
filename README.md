# Software Delivery & Telemetry Simulation Lab

Software Delivery & Telemetry Simulation Lab is an educational, local-only cybersecurity demo that shows how trusted-looking software download portals can influence users while keeping the implementation ethical, transparent, and consent-based.

## Viva Explanation

"This project demonstrates how software delivery attacks can socially engineer users through trusted-looking download portals. However, the implementation is fully ethical and transparent. The executable clearly requests consent before collecting only non-sensitive telemetry like processes and system information. The objective is to understand delivery mechanisms, detection opportunities, and defensive monitoring."

## Components

- Frontend: React + Vite + TailwindCSS + Framer Motion.
- Backend: Node.js + Express API on `http://localhost:5000`.
- Agent: Python GUI telemetry client using `tkinter`, `psutil`, `platform`, `requests`, `json`, and `datetime`.
- Docs: architecture diagram, data flow, and security learning report.

## Demo Flow

1. Open the website at `http://127.0.0.1:5173`.

   Say: "This simulates a modern software delivery campaign where attackers impersonate trusted applications."

2. Open the consent modal.

   Say: "Unlike real malicious campaigns, this simulation is fully transparent and requires explicit user consent before execution."

3. Download the Windows file.

   Demo filename: `TelegraphSecure_Setup.exe`

4. Run the executable agent.

   Show the consent screen, progress bar, and status logs:

   ```text
   [+] Detecting OS version...
   [+] Enumerating running processes...
   [+] Collecting CPU information...
   [+] Packaging telemetry...
   [+] Sending to local server...
   ```

5. Show the backend console receiving telemetry.

   Example console output:

   ```text
   [SERVER] Connection received
   [SERVER] Telemetry packet received
   [SERVER] Host OS: Windows 11
   [SERVER] Running Processes: 124
   [SERVER] Logged Successfully
   ```

6. Explain detection opportunities.

   Say: "Although the telemetry collection is benign, EDR or SOC systems could still detect behaviors such as process enumeration, outbound HTTP POST requests, executable launches, and unusual download patterns."

## Ethical Scope

This lab does not collect credentials, browser data, documents, personal files, cookies, keystrokes, shells, tokens, persistence artifacts, ransomware behavior, or privileged information. The Python agent only runs after visible user approval and only sends data to `http://localhost:5000/telemetry`.

## Folder Structure

```text
Software-Delivery-Telemetry-Lab/
|-- frontend/
|-- backend/
|-- agent/
|-- screenshots/
|-- docs/
`-- README.md
```

## Run Backend

```powershell
cd "c:\Users\Manoj\Desktop\fake software\backend"
npm install
npm run dev
```

API server: `http://localhost:5000`

## Run Frontend

```powershell
cd "c:\Users\Manoj\Desktop\fake software\frontend"
npm install
npm run dev
```

Website: `http://127.0.0.1:5173`

## Run Agent

Python must be installed first.

```powershell
cd "c:\Users\Manoj\Desktop\fake software\agent"
py -m pip install -r requirements.txt
py agent.py
```

## Build Executable

```powershell
cd "c:\Users\Manoj\Desktop\fake software\agent"
py -m pip install pyinstaller
pyinstaller --onefile --windowed --name TelegraphSecure_Setup agent.py
```

The built executable will be created under `agent/dist/TelegraphSecure_Setup.exe`.

## API Endpoints

`POST /telemetry`

Receives local lab telemetry:

```json
{
  "osVersion": "Windows 11 10.0.22631",
  "cpuInfo": "Intel64 Family 6 Model 186 Stepping 3, GenuineIntel",
  "ramInfo": "16.0 GB",
  "processes": ["explorer.exe", "Code.exe"],
  "timestamp": "2026-05-07T10:00:00.000Z"
}
```

`GET /logs`

Returns collected telemetry logs from `backend/telemetry_logs.json`.

## Closing Line

"This project helped demonstrate how modern software delivery attacks operate, how telemetry-based behaviors appear from a defender's perspective, and how transparency and ethical safeguards can be integrated into cybersecurity simulations."
