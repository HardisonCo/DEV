This plan introduces **hms-launcher** – a full-screen TTY menu (Python /
`questionary`) that guides the developer through:

1. Selecting the component (HMS-API, HMS-ETL, …)
2. Choosing the mode (dev / test / ci)
3. Optionally adjusting:
   • Port mapping • Detached vs foreground • Extra `.env` file
4. Pressing <ENTER> to spawn a **tmux** workspace with:
   • Pane 0 – build/pull + container start  
   • Pane 1 – `docker logs --follow` (live colour logs)  
   • Pane 2 – an interactive shell inside the container (`docker exec`)  
   Users quit with standard tmux keys or fallback to a non-tmux path if tmux
   is unavailable.

Benefits  
• Zero cognitive overhead (arrow keys instead of flags)  
• Consistent cross-platform UX (macOS, Linux, WSL)  
• Keeps all heavy-lifting in the existing Bash runner → no duplication  
• Extensible to future options (database seeding, hot-reload toggles, etc.)

────────────────────────────────────────────────────────────────────────
1  Goals / Non-Goals
────────────────────────────────────────────────────────────────────────
Goals
• Reduce "time-to-first-run" for new contributors < 90 s  
• Abstract the flag syntax behind a discoverable UI  
• Provide rich panes for build, logs & shell via tmux  
• Fail gracefully when tmux is not present  
• Ship as a single self-contained binary/script (`pipx install hms-launcher`)

Non-Goals
• Replacing the Bash runner – it remains the canonical execution path  
• Adding Kubernetes orchestration (handled by separate tooling)  
• Handling production deployments (scope = local / CI only)

────────────────────────────────────────────────────────────────────────
2  Stakeholders
────────────────────────────────────────────────────────────────────────
| Role | Name / Slack | Responsibility |
|------|--------------|----------------|
| Sponsor | CTO (@leo) | Budget & priority |
| Product owner | DevOps Lead (@marie) | Vision, acceptance |
| Tech lead | @alice | Architecture & code reviews |
| Devs | @bob, @carol | Implementation |
| QA | @erin | Test plan & execution |
| Docs | @frank | User-facing documentation |

────────────────────────────────────────────────────────────────────────
3  Requirements
────────────────────────────────────────────────────────────────────────
Functional
• F-01 Display a scrollable list of HMS components (auto-discovered from
       `SYSTEM_COMPONENTS/`)  
• F-02 Prompt for mode (dev | test | ci), default = dev  
• F-03 Allow overriding port mapping (validated `^\d+:\d+$`)  
• F-04 Boolean toggle "detached" (default = off)  
• F-05 Optional path prompt for `.env` file (must exist)  
• F-06 Render a confirmation summary and proceed on <ENTER>  
• F-07 Spawn tmux _or_ fallback to inline execution  
• F-08 Exit codes bubble up (non-zero on failure)

Non-Functional
• NF-01 Must install via `pipx install hms-launcher` in < 10 s  
• NF-02 Memory footprint < 50 MB RSS while idle  
• NF-03 Support terminals ≥ 80×24 (no hardcoded coordinates)  
• NF-04 Pass Shellcheck & Ruff/Pylint CI gates  
• NF-05 Respect `$NO_COLOR` & TERM detection for colourised output  
• NF-06 Signed Git tag release procedure with changelog

Security
• Separation of privileges mirrors Bash runner (non-root in container)  
• No outbound network calls except launching docker/tmux

────────────────────────────────────────────────────────────────────────
3·A  Additional Requirements  (Deploy / Test / Debug)
────────────────────────────────────────────────────────────────────────
Functional  
• F-09 "Deploy" mode – deploy container images to AWS ECS **or** Laravel Forge  
          – must tail CloudWatch logs / Forge deployment log live  
          – must write a JSON summary to `.hms-launch-history/<timestamp>.json`  
• F-10 "Test-Runner" mode – execute the component's test suite  
          – show nice summary (✅ pass / ❌ fail) in Pane 1  
          – exit code bubbles up to launcher for CI gates  
• F-11 "Debug" mode – subscribe to  
          a) Sentry stream (if `SENTRY_DSN` set)    b) CloudWatch logs (if AWS)  
          – on every error:  
               1. print stack-trace with colour  
               2. call OpenAI ChatCompletion (opt-in) to suggest fixes  
• F-12 Menu remembers the **last used** component + mode (history file)  
• F-13 All three modes must be selectable via CLI flags as well  
          (`--deploy`, `--test`, `--debug`) for automation

Non-Functional  
• NF-07 CloudWatch log polling ≤ 5 s latency  
• NF-08 Deploy summary persisted for at least 30 days  
• NF-09 AI debug helper must redact secrets before sending to LLM  
• NF-10 Works with AWS profiles **or** explicit `AWS_*` env-vars  

Observability  
• O-01 All launcher actions log to `~/.hms-launcher/launcher.log` (rotating)  
• O-02 Each deploy writes to CloudWatch metric `HMS/DeploySuccess`  

────────────────────────────────────────────────────────────────────────
4  Technology Decision – Python vs Rust
────────────────────────────────────────────────────────────────────────
| Criterion | Python (`questionary`) | Rust (`dialoguer`) |
|-----------|------------------------|--------------------|
| Build time | N/A (script) | Cargo compile (~1 m) |
| Distribution | pip/pipx, ubiquitous | Static binary (💚) |
| Term UI power | ✔ key navigation, colours | ✔ key navigation, colours |
| Team familiarity | High | Medium |
| Windows support | Good (WSL native) | Good |
Decision: **Python + questionary** (faster to prototype, no compile step).  
We reserve ADR-017 should a Rust rewrite become necessary.

────────────────────────────────────────────────────────────────────────
5  System Architecture
────────────────────────────────────────────────────────────────────────

Add to Chat⌘L
⌘K to generate a command
not working at all

The script was failing on macOS because the ${var,,} lowercase-expansion syntax is only available in Bash 4+.
I've replaced those expansions with a portable tr fallback and added an explicit PROJECT_SLUG variable.
Nothing else changed.
9 hidden lines
You can now retry:
test
If you'd prefer the helper to live at repo-root (so you can simply run ./run_in_container.sh), let me know and I'll move it in a follow-up patch.
make a plan to implement this  as tty prompts using a tty prompt packate from python or rust  to give options and have user pick option of what to do, then launching cli or custom interface w/ tmux to view 

Here's a concrete, step-by-step implementation plan for turning the current "type-flags" shell helper into an interactive TTY launcher that:
Presents a full-screen, arrow-key prompt where the developer chooses
WHICH HMS component to run
WHICH mode (dev / test / ci)
Optional advanced settings (ports, env-file, detached vs foreground)
Spawns (or attaches to) a tmux workspace that shows:
Pane 1 – the container build/pull progress
Pane 2 – color-coded live logs (docker logs –follow)
Pane 3 – an interactive shell inside the container (optional)
Falls back gracefully to "plain text prompts + no tmux" if the user's
terminal lacks tmux or does not support full-screen control sequences.
────────────────────────────────────────────────────────────────────────
A Technology Selection
────────────────────────────────────────────────────────────────────────
Prompt library:
Python questionary (🆓, rich-style colors, zero ncurses)
OR
Rust dialoguer (fully native, binary distribution)
Both support arrow-key menus, confirmation screens and text inputs.
Wrapper tool name: hms-launcher (single file, < 300 LOC).
Underlying runner: still the Bash script (codex-cli/scripts/run_in_container.sh).
Multiplexing: tmux — cross-platform on mac-/Linux, tiny footprint.
────────────────────────────────────────────────────────────────────────
B End-User Flow
────────────────────────────────────────────────────────────────────────
$ hms-launcher
TTY menu appears:
Apply to CLA.md
└───────────────────────────────────────┘
Next screen: choose mode, port, detached, extra env-file.
"Review & confirm" summary ↦ press <ENTER>.
The script spawns/attaches to tmux -s hms <layout> and populates panes:
| Pane | Command | Purpose |
|------|---------|---------|
| 0 | run_in_container.sh … | build/pull + start |
| 1 | docker logs -f <ctr> | live logs |
| 2 | docker exec -it <ctr> bash | interactive shell |
User closes tmux with Ctrl-b :kill-session when done.
────────────────────────────────────────────────────────────────────────
C Detailed Work-Breakdown (Stories & Tasks)
────────────────────────────────────────────────────────────────────────
| Epic | Story | Owner | ETA | Status |
|------|-------|-------|-----|--------|
| P-01 Prompt UX | Evaluate Python vs Rust, spike demo | @alice | 0.5 d | ☐ |
| | Finalise lib choice (questionary) | @alice | 0.5 d | ☐ |
| | Implement menus & validation | @alice | 1 d | ☐ |
| P-02 tmux Workspace | Design 3-pane layout | @bob | 0.5 d | ☐ |
| | Auto-attach / create session logic | @bob | 0.5 d | ☐ |
| | Graceful fallback (no tmux) | @bob | 0.5 d | ☐ |
| P-03 Runner Integration | Argument mapping → bash script | @carol | 0.5 d | ☐ |
| | Error bubbling & exit codes | @carol | 0.5 d | ☐ |
| P-04 Packaging | pipx install hms-launcher & Nix flake | @dave | 0.5 d | ☐ |
| P-05 Docs & Demos | GIF + README updates | @frank | 0.5 d | ☐ |
| QA | Smoke test matrix (bash/zsh, mac/linux) | QA team | 1 d | ☐ |
Total effort ≈ 4 person-days.
────────────────────────────────────────────────────────────────────────
D High-Level Implementation Sketch (Python prototype)
────────────────────────────────────────────────────────────────────────
Apply to CLA.md
)
Key points:
Uses only questionary (pip install — Pure-Python) → no curses headaches.
Detects absence of tmux and falls back.
All heavy lifting remains in the Bash runner, so zero duplication of container logic.
────────────────────────────────────────────────────────────────────────
E Risk & Mitigation
────────────────────────────────────────────────────────────────────────
tmux not installed → fallback already covered; we'll add Doc note.
Windows users (WSL) → tests on Ubuntu-WSL; if tmux fails we still have plain mode.
Prompt libraries not in PATH inside CI → the launcher is dev-only, CI still calls bash script directly.
────────────────────────────────────────────────────────────────────────
F Acceptance Criteria
────────────────────────────────────────────────────────────────────────
✓ Running hms-launcher displays interactive menus in 80×24 terminal.
✓ Choosing HMS-API / dev produces identical results to current manual flag invocation.
✓ Pressing q within tmux terminates all panes and cleans up the container.
✓ README contains animated asciinema demo.
────────────────────────────────────────────────────────────────────────
G Next Steps (Action Items Today)
────────────────────────────────────────────────────────────────────────
pip install --user questionary (or cargo add dialoguer if Rust is preferred).
Create scripts/hms_launcher.py scaffold with menu function.
Open PR "MIG-UI-01: interactive TTY launcher (prototype)".
Review & merge; iterate on tmux layout.
Let me know which language (Python vs Rust) you'd like to go with, and I'll start the actual code drop.
document this plan in the greatest detail possible and add implementaton tracking

Below is a fully-fleshed, engineering-grade design & tracking document for the Interactive TTY Launcher ("hms-launcher").
Copy/paste it into docs/devops/interactive-launcher-plan.md (or a location of your choice) and treat it as the single source of truth for this initiative.
Apply to CLA.md
:
./codex-cli/scripts/run_in_container.sh -p HMS-API -P 8080:8080 dev
Apply to CLA.md
───────────────────────────────────────────────────
┌──────────┐ ┌──────────────┐ ┌──────────────┐
│ Terminal │─input─▶│ hms-launcher │─shell─▶│ run_in_…sh │─► docker / tmux
└──────────┘ └──────────────┘ └──────────────┘
• `hms-launcher` is a thin orchestrator that converts user choices into the
  exact argument vector for `run_in_container.sh`.  
• tmux session name = `hms_<component-slug>`.  
• Container name = computed by Bash runner (unchanged).

────────────────────────────────────────────────────────────────────────
6  Detailed UX Specification
────────────────────────────────────────────────────────────────────────
A Component Picker  
┌──────────── Select a component ────────────┐
│ ▸ HMS-API (Laravel 8, PHP 8.3) │
│ HMS-ETL (Python 3.12, Airflow 2.9) │
│ HMS-MFE (Nuxt 4, Node 22) │
│ … │
└─────────────────────────────────────────────┘
Components list pulled via `glob.glob('SYSTEM_COMPONENTS/HMS-*')`.

B Mode & Options  
────────────────────────────────────────────────────────────────────────
8  Fallback Mode (No tmux)
Mode ▸ dev test ci
Port mapping 8080:8080
Detached false
Extra .env (none)
C Summary  
Component HMS-API
Mode dev
Port map 8080:8080
Detached false
.env file –
Proceed? [ Yes ] <No>
D tmux Layout (95×24 split)  
┌─────────────────────────────────────────────────────┐
│ Pane 0: build/pull + start │
├─────────────┬──────────────────────────────────────┤
│ Pane 1 │ Pane 2 │
│ docker logs │ docker exec -it <ctr> bash │
└─────────────┴──────────────────────────────────────┘

────────────────────────────────────────────────────────────────────────
7  CLI Mapping
────────────────────────────────────────────────────────────────────────
| UI Field | Bash Flag Translation |
|----------|-----------------------|
| component | `-p <COMP>` |
| mode      | positional `dev|test|ci` |
| port      | `-P <portmap>` |
| detached  | `-d` (if true) |
| .env file | `-e <path>` |

Example exec string
────────────────────────────────────────────────────────────────────────
If `tmux` binary not found **OR** `$HMS_LAUNCHER_NO_TMUX=1`, the tool:
1. Prints the command it will run (for copy-pasting).  
2. Executes it inline (`subprocess.run(cmd, shell=True)`).  
3. Attaches `docker logs -f` after container start.  
4. On Ctrl-C, stops tailing but leaves the container unless in foreground.

────────────────────────────────────────────────────────────────────────
9  Environment & Distribution
────────────────────────────────────────────────────────────────────────
• Python ≥ 3.10, no non-stdlib deps except `questionary`, `rich`.  
• Recommended install: `pipx install --python python3.11 .`  
• `pyproject.toml` with `[project.scripts] hms-launcher="launcher:main"`  
• Nix flake overlay for nix users: `nix run .#hms-launcher`.

────────────────────────────────────────────────────────────────────────
10  Testing Strategy
────────────────────────────────────────────────────────────────────────
Unit
• Input validators (port regex, env-path existence)  
• Command-line generation

Integration
• `pytest + pexpect` spawning a pseudo-tty, navigating menus programmatically.  
• tmux present vs missing matrix.

Shell
• bats test calling `hms-launcher --non-interactive <json>` to ensure zero-UI mode works for CI.

CI Pipeline
1. `pip install -e .[dev]`  
2. `ruff check . && black --check`  
3. `pytest -q`  
4. Act-based GitHub Action runs full interactive test (using `vxvnc+twm`).

────────────────────────────────────────────────────────────────────────
11  Risk Register
────────────────────────────────────────────────────────────────────────
| ID | Risk | Likelihood | Impact | Mitigation |
|----|------|------------|--------|------------|
| R-01 | Terminal not 80×24 | Low | Medium | Detect cols/lines; truncate strings |
| R-02 | tmux ≥ 3.2 required | Med | Med | Version check; fallback |
| R-03 | Python env conflicts | Med | Low | Encourage `pipx`; provide static nix pkg |
| R-04 | Unrecognised component path | Low | Low | Validate on scan; error message |

────────────────────────────────────────────────────────────────────────
12  Implementation Work-Breakdown (Tracker)
────────────────────────────────────────────────────────────────────────
| Epic          | Story (PR)                      | Key   | Owner | Dur | Dep      | Status |
|---------------|---------------------------------|-------|-------|-----|----------|--------|
| P-01 Prompt UX | Spike library comparison         | UX-01 | @alice | 0.5d | – | ✅ |
|               | Implement basic menus            | UX-02 | @alice | 1d  | UX-01    | ☐ |
|               | Add validators + summary         | UX-03 | @alice | 0.5d | UX-02    | ☐ |
| P-02 tmux     | Layout script + attach            | TM-01 | @bob   | 0.5d | UX-02    | ☐ |
|               | Fallback logic                   | TM-02 | @bob   | 0.5d | TM-01    | ☐ |
| P-03 Runner Integration | Flag mapping & exec            | RI-01 | @carol | 0.5d | UX-03    | ☐ |
|                  | Error bubbling                  | RI-02 | @carol | 0.5d | RI-01    | ☐ |
| P-04 Packaging | pyproject + pipx test           | PK-01 | @dave  | 0.5d | RI-02    | ☐ |
|                | Nix flake                        | PK-02 | @dave  | 0.5d | PK-01    | ☐ |
| P-05 Docs     | README + GIF                     | DOC-01 | @frank | 0.5d | UX-03    | ☐ |
| QA           | Interactive e2e test             | QA-01 | @erin  | 1d  | TM-02     | ☐ |
| P-06 Deploy UX| Menu item + form                 | UX-04 | Alice | .5d | UX-03    | ☐ |
|               | ops-py AWS deploy wrapper        | DP-01 | Bob   | 1d  | TM-02     | ☐ |
|               | ops-py Forge wrapper             | DP-02 | Bob   | .5d | DP-01     | ☐ |
| P-07 Testing  | Test-Runner integration          | TS-01 | Carol | .5d | UX-03     | ☐ |
| P-08 Debugger | Live Sentry/CWL stream           | DB-01 | Dave  | 1d  | UX-03     | ☐ |
|               | AI explain-helper (OpenAI)         | DB-02 | Dave  | .5d | DB-01     | ☐ |
| QA           | End-to-end matrix inc. deploy     | QA-02 | Erin  | 1d  | DP-02/DB-02 | ☐ |

Legend  ✅ Done · ☐ Todo · △ In progress · ✖ Blocked

Machine-readable JSON (for Linear/Jira import):
```json
[
  {"key":"UX-02","name":"Menu implementation","owner":"alice","status":"todo"},
  {"key":"TM-01","name":"tmux layout","owner":"bob","status":"todo"},
  {"key":"RI-01","name":"Flag mapping","owner":"carol","status":"todo"}
  // …
]
```

────────────────────────────────────────────────────────────────────────
13  Timeline (Gantt)
────────────────────────────────────────────────────────────────────────
```text
May 12 ─┬─ UX-02 ██████
        ├─ UX-03   ██
        ├─ TM-01   ██
        ├─ TM-02    █
        ├─ RI-01    █
        ├─ RI-02    █
        ├─ PK-01    █
        ├─ PK-02    █
        ├─ QA-01      ██
        └─ DOC-01        █
GA tag v1.0.0 – July 03
```

────────────────────────────────────────────────────────────────────────
14  Acceptance Criteria (Definition of Done)
────────────────────────────────────────────────────────────────────────
1. `pipx run hms-launcher` presents menu within 500 ms.  
2. Selecting HMS-API / dev runs existing Bash script and shows tmux panes.  
3. Exiting tmux leaves no dangling containers (`docker ps` clean).  
4. Fallback path works when `which tmux` fails.  
5. CI job passes on Ubuntu-latest & macOS-latest.

────────────────────────────────────────────────────────────────────────
15  Future Enhancements (Backlog)
────────────────────────────────────────────────────────────────────────
• Pre-seed database via menu option  
• Shortcut profiles (last used config)  
• Native Rust re-implementation for single binary release  
• Autocomplete when launched with `hms-launcher --component <tab>`

────────────────────────────────────────────────────────────────────────
Appendix A  Prototype Snippet (reference only)
────────────────────────────────────────────────────────────────────────
```python
# launcher.py (condensed)
import os, subprocess, shlex, shutil, questionary as q
COMP=os.listdir("SYSTEM_COMPONENTS")  # …

comp = q.select("Component?", choices=COMP).ask()
mode = q.select("Mode?", choices=["dev","test","ci"]).ask()
port = q.text("Port map:", default="8080:8080").ask()
cmd = f"./codex-cli/scripts/run_in_container.sh -p {comp} -P {port} {mode}"
if shutil.which("tmux"):
    subprocess.run(["tmux","new","-As",f"hms_{comp.lower()}",cmd])
else:
    subprocess.run(cmd, shell=True)
```

────────────────────────────────────────────────────────────────────────
That's everything engineering, product & docs need to execute the feature.  
Ping the DevOps Guild once the document is checked in so we can start opening the UX-02 branch.