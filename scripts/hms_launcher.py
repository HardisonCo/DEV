#!/usr/bin/env python3
"""
hms_launcher.py — Interactive TTY launcher for HMS modules

Presents an arrow-key menu to select:
  • Component (HMS-API, HMS-ETL, …)
  • Mode (dev, test, ci)
  • Port mapping
  • Detached vs foreground
  • Optional .env file

Then spins up a tmux workspace with panes for:
  0) run_in_container.sh (build/pull + start)
  1) docker logs -f
  2) docker exec -it … bash

Falls back to inline execution if tmux is unavailable.
"""
import os
import glob
import shlex
import shutil
import subprocess
import getpass
import questionary as q

def main():
    # 1) Discover components
    base = "SYSTEM_COMPONENTS"
    comps = [
        os.path.basename(p)
        for p in glob.glob(os.path.join(base, "HMS-*"))
        if os.path.isdir(p)
    ]
    if not comps:
        print(f"No components found under {base}")
        exit(1)

    # 2) Interactive prompts
    comp   = q.select("Select a component:", choices=comps).ask()
    mode   = q.select("Select mode:",      choices=["dev","test","ci"]).ask()
    port   = q.text("Port mapping (host:container)", default="8080:8080").ask()
    detach = q.confirm("Run detached (background)?", default=False).ask()
    envf   = q.text("Optional .env file (path)", default="").ask()

    # 3) Build command
    script = "./codex-cli/scripts/run_in_container.sh"
    args   = [script, "-p", comp, "-P", port]
    if detach:
        args.append("-d")
    if envf:
        args.extend(["-e", envf])
    args.append(mode)
    cmd = " ".join(shlex.quote(a) for a in args)

    # 4) Compute session & container names
    slug      = comp.lower().replace(" ", "_")
    user      = getpass.getuser()
    session   = f"hms_{slug}"
    container = f"{user}_{slug}_{mode}"

    # 5) tmux vs fallback
    if shutil.which("tmux"):
        # Pane 0: start container
        subprocess.run(["tmux","new-session","-d","-s",session,cmd], check=True)
        # Pane 1: live logs
        subprocess.run(
            ["tmux","split-window","-v","-t",session,f"docker logs -f {container}"],
            check=True
        )
        # Pane 2: interactive shell
        subprocess.run(
            ["tmux","split-window","-h","-t",session,f"docker exec -it {container} bash"],
            check=True
        )
        # Arrange & attach
        subprocess.run(["tmux","select-layout","-t",session,"tiled"], check=True)
        subprocess.run(["tmux","attach","-t",session], check=True)
    else:
        print("tmux not found; running inline:")
        print(cmd)
        subprocess.run(cmd, shell=True, check=True)

if __name__ == "__main__":
    main() 