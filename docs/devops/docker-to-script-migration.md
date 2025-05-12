# HMS Containers — “Compose-less” Migration Plan  
Status · **Draft v0.2** Owner · DevOps Guild Target Release · 2024-06-30  
_Last updated: 2025-05-12 14:58 UTC_

> “Make it hard to do the wrong thing and trivial to do the right thing.”

---

## 0. Executive Summary (Deep Dive)

Today each HMS module ships one or more of:

* `docker-compose.yml`
* bespoke `Dockerfile`s
* home-grown shell helpers (`hms.project_mac`, `start-container`, …)

The sprawl hurts onboarding, CI reproducibility and security posture.  
**Goal:** converge on a single parametric script `./run_in_container.sh` that can:

1. Build/pull a module-specific image (multi-stage roots per language).  
2. Start the container with sensible defaults for dev, test & CI.  
3. Delegate multi-process orchestration to a _unified_ `supervisord.conf`.  

Key measurable success criteria:

| Metric | Current | Target |
|--------|---------|--------|
| “Time-to-first-API 200” (fresh clone → `curl /health`) | 9 m 12 s | < 60 s |
| Unique image tags built in CI | 47 | ≤ 5 |
| Critical vulnerabilities in base images | 27 | 0 |
| Docs pages to read before onboard | 4 | 1 |

---

## 1. Architectural Decisions Record (ADR)

| # | Decision | Consequences |
|---|----------|--------------|
| ADR-012 | _Multi-stage language-root images_ | + Build-kit caching across modules.<br>− Slightly harder to debug layer contents. |
| ADR-013 | _Ephemeral bridge network per invocation_ | + No conflicts w/ host VPN.<br>+ Deterministic container IPs. |
| ADR-014 | _`supervisord` as PID 1_ | + One place for logs & health-checks.<br>− Adds tiny memory overhead (~4 MiB). |
| ADR-015 | _Host UID/GID mapping_ | + No root-owned artefacts on host.<br>− Requires ARG propagation in Dockerfile. |
| ADR-016 | _`seccomp=default-deny` + `--cap-drop=ALL`_ | + Baseline hardening.<br>− Might break ptrace/gdb in container (acceptable). |

---

## 2. Artefact Register & Ownership

| ID | Artefact | Path (old → new) | Owner | Lifecycle & Change Control |
|----|----------|------------------|-------|----------------------------|
| AR-01 | Compose manifests | `*/docker-compose.yml` → archived under `legacy/compose/` | Module Maintainers | **Retired** after v1.0.0 |
| AR-02 | Language-root images | `docker/base-images/{php,node,go,py}` | DevOps | SemVer; Cosign-signed |
| AR-03 | Entry script | `/run_in_container.sh` | DevOps | Authoritative; SemVer via repo tag |
| AR-04 | Supervisor template | `/docker/supervisor/supervisord.conf` | DevOps | Versioned w/ repo |
| AR-05 | Documentation | `docs/devops/docker-to-script-migration.md` | DevOps | Living doc (PR review) |

---

## 3. Phase Plan (Granular Tasks)

### Phase 1 — Image Optimisation (24 → 25 Jun)
1. **Discovery** (`MIG-01-A`)  
   * `grep -R "^FROM" */Dockerfile` to list base images & versions.
2. **Design** (`MIG-01-B`)  
   * Draft Dockerfile templates per language.  
   * Agree on runtime UID convention (`1000:1000`).
3. **Implementation** (`MIG-01-C`)  
   * Build `hms-php-fpm-nginx` (multi-stage: composer → runtime).  
   * Build `hms-node` (pnpm cache layer).  
   * Push & sign to GHCR (`cosign sign`).
4. **Validation** (`VAL-01`)  
   * `trivy image --severity CRITICAL,HIGH …` must return 0.

### Phase 2 — Script Authoring (24 → 26 Jun)
1. Skeleton script (`MIG-02-A`) — parse flags, display help.  
2. Image pull/build logic (`MIG-02-B`).  
3. UID/GID mapping & volume mount (`MIG-02-C`).  
4. CI network isolation (`MIG-02-D`).  
5. Interactive vs detached mode (`MIG-02-E`).  
6. Health-check tail-loop (`MIG-02-F`).  
7. Unit tests (`bats`) (`MIG-02-G`).

### Phase 3 — Security Hardening (25 → 27 Jun)
* Seccomp profile generator (`go-seccomp`).  
* Capability drop late-bind script.  
* Read-only remount after dependency install.

### Phase 4 — Supervisord Unification (26 → 27 Jun)
* Merge variant configs → Jinja2 template.  
* `curl --unix-socket /run/supervisor.sock check` liveness probes.  
* Systemd service unit for production reuse.

### Validation Buffer & Docs (27 → 30 Jun)

---

## 4. Implementation Tracking (WBS)

| Epic | Story | Jira Key | Owner | ETA | Dep -> | Status |
|------|-------|---------|-------|-----|--------|--------|
| Image root | Build php image | MIG-01-C-php | @bob | 24 Jun | MIG-01-B | ☑ |
| Image root | Build node image | MIG-01-C-node | @bob | 24 Jun | MIG-01-B | ☐ |
| Script | Skeleton & help | MIG-02-A | @carol | 24 Jun | – | ☐ |
| Script | Image handling | MIG-02-B | @carol | 24 Jun | MIG-02-A | ☐ |
| Script | UID mapping | MIG-02-C | @carol | 25 Jun | MIG-02-B | ☐ |
| Script | Network iso | MIG-02-D | @carol | 25 Jun | MIG-02-C | ☐ |
| Script | Health loop | MIG-02-F | @carol | 26 Jun | MIG-02-D | ☐ |
| Doc | Write deep-dive doc | MIG-DOC-1 | @frank | 24 Jun | – | ☑ |
| CI | Update workflows | MIG-CI-1 | @alice | 26 Jun | MIG-02-B | ☐ |

Legend: ☑ Done · ☐ Todo · △ In-progress · ✖ Blocked

A machine-readable copy is embedded as JSON at the bottom of this file for easy dashboard import.

---

## 5. Validation & Testing Matrix

| Scenario | Mode | Expected | Tooling |
|----------|------|----------|---------|
| Fresh clone on macOS | `./run_in_container.sh -p HMS-API` | Health 200 < 60 s | bats, curl |
| GH Action workflow | `CI=true … ci` | All tests pass | act, trivy |
| Permission test | Create file inside container | Ownership = host UID | bats |
| Egress test | Container tries `curl google.com` in CI | FAIL (blocked) | nc |

---

## 6. Risk & Mitigation Log (Triggers & Fall-backs)

| Risk | Trigger | Mitigation | Fall-back Plan |
|------|---------|------------|----------------|
| Seccomp breakage | Any syscall fail in health loop | Swap to permissive profile, capture strace | Disable seccomp, log incident |
| UID mismatch | File perms mismatch in smoke test | Map UID using build-args | Run container as root (last resort) |
| Image size > 1 GiB | Post-build size check | Multi-stage pruning, `apk --no-cache` | Split images per service |

---

## 7. RACI Matrix

| Activity | R | A | C | I |
|----------|---|---|---|---|
| Build images | @bob | Guild Lead | QA | All |
| Script | @carol | Guild Lead | @alice | All |
| Docs | @frank | Guild Lead | – | All |
| Release | Release Eng. | CTO | QA | All |

---

## 8. Appendix A — AGENTS.md Path Map (auto-generated)
HMS-API -> SYSTEM_COMPONENTS/HMS-API
HMS-ETL -> SYSTEM_COMPONENTS/HMS-ETL
HMS-MFE -> SYSTEM_COMPONENTS/HMS-MFE
---

## 9. Appendix B — GitHub Action Δ

* update `ci.yml` step:
  ```yaml
  - name: Spin up service under test
    run: ./run_in_container.sh -p HMS-API ci
  ```
* mount `~/.docker/config.json` for registry auth
* upload `/srv/app/test-reports` as artefact

---

## 10. Appendix C — Container Runtime Spec

```toml
[runtime]
user = "1000:1000"
capabilities = []
seccomp_profile = "/etc/seccomp/hms-default.json"
health_endpoint = "http://localhost:8080/health"
```

---

### 📊  Machine-readable WBS (import into Linear/Jira)

```json
[
  {"key":"MIG-01-C-php","name":"Build php image","status":"done"},
  {"key":"MIG-01-C-node","name":"Build node image","status":"todo"},
  {"key":"MIG-02-A","name":"Script skeleton","status":"todo"},
  {"key":"MIG-02-B","name":"Script image logic","status":"todo"},
  {"key":"MIG-02-C","name":"Script UID mapping","status":"todo"},
  {"key":"MIG-02-D","name":"Script network iso","status":"todo"},
  {"key":"MIG-02-F","name":"Script health loop","status":"todo"},
  {"key":"MIG-DOC-1","name":"Deep dive doc","status":"done"},
  {"key":"MIG-CI-1","name":"Update CI workflows","status":"todo"}
]
```
```

```1:220:run_in_container.sh
#!/usr/bin/env bash
# -------------------------------------------------------------------
# run_in_container.sh  —  Unified container launcher for HMS modules
#
# Flags:
#   -p, --project   Component to run (default: HMS-API)
#   -d, --detached  Run in background (detached) mode
#   -P, --port      Port mapping (default: 8080:8080)
#   -e, --env-file  Extra .env file to inject
#   --cmd           Override default CMD (e.g. "bash")
#   -h, --help      Show help
#
# Positional arg:
#   MODE            dev | ci | test    (default: dev)
#
# Examples:
#   ./run_in_container.sh                          # HMS-API dev
#   ./run_in_container.sh -p HMS-ETL test          # runs test suite
#   CI=true ./run_in_container.sh ci               # CI non-interactive
# -------------------------------------------------------------------
set -euo pipefail

# ---------- Defaults ------------------------------------------------
PROJECT="HMS-API"
DETACHED="false"
PORT_MAP="8080:8080"
ENV_FILE=""
CUSTOM_CMD=""
MODE="dev"   # dev | ci | test

# ---------- Helpers -------------------------------------------------
die() { echo "Error: $*" >&2; exit 1; }

usage() { grep -E "^# " "$0" | sed 's/^# //'; exit 0; }

# ---------- Parse CLI ----------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--project)   PROJECT="${2:-}"; shift 2 ;;
    -d|--detached)  DETACHED="true"; shift ;;
    -P|--port)      PORT_MAP="${2:-}"; shift 2 ;;
    -e|--env-file)  ENV_FILE="${2:-}"; shift 2 ;;
    --cmd)          CUSTOM_CMD="${2:-}"; shift 2 ;;
    -h|--help)      usage ;;
    dev|ci|test)    MODE="$1"; shift ;;
    *) die "Unknown arg: $1";;
  esac
done

# ---------- Validate ------------------------------------------------
PROJECT_PATH="SYSTEM_COMPONENTS/${PROJECT}"
[[ -d "${PROJECT_PATH}" ]] || die "Unknown project: ${PROJECT}"

command -v docker >/dev/null || die "Docker is required"

HOST_UID="$(id -u)"
HOST_GID="$(id -g)"

# ---------- Image Selection ----------------------------------------
TAG="${MODE}"
IMAGE="ghcr.io/our-org/${PROJECT,,}:${TAG}"

if ! docker image inspect "${IMAGE}" >/dev/null 2>&1; then
  echo "⇢ Image ${IMAGE} not found — attempting to pull"
  if ! docker pull "${IMAGE}" >/dev/null 2>&1; then
    echo "⇢ Pull failed; building locally"
    docker build \
      --build-arg HOST_UID="${HOST_UID}" \
      --build-arg HOST_GID="${HOST_GID}" \
      -t "${IMAGE}" \
      -f "${PROJECT_PATH}/Dockerfile" \
      "${PROJECT_PATH}"
  fi
fi

# ---------- Container Lifecycle ------------------------------------
CONTAINER="${USER:-dev}_${PROJECT,,}_${MODE}"
docker rm -f "${CONTAINER}" >/dev/null 2>&1 || true

DETACH_FLAG=""; [[ "${DETACHED}" == "true" ]] && DETACH_FLAG="--detach"

ENV_FLAGS=""
[[ -n "${ENV_FILE}" ]] && ENV_FLAGS="--env-file ${ENV_FILE}"

# CI network isolation
NET_FLAGS=""
if [[ "${CI:-}" == "true" || "${MODE}" == "ci" ]]; then
  NET_FLAGS="--network none"
fi

CMD="${CUSTOM_CMD:-/usr/bin/supervisord -c /etc/supervisord.conf}"

echo "⇢ Starting container ${CONTAINER}"
docker run --name "${CONTAINER}" \
  ${DETACH_FLAG} \
  ${ENV_FLAGS} \
  ${NET_FLAGS} \
  --user "${HOST_UID}:${HOST_GID}" \
  --cap-drop ALL \
  --security-opt seccomp=unconfined \
  -v "${PWD}/${PROJECT_PATH}:/srv/app" \
  -p "${PORT_MAP}" \
  "${IMAGE}" \
  ${CMD}

# ---------- Post-start ---------------------------------------------
if [[ "${DETACHED}" != "true" ]]; then
  echo "⇢ Tailing logs (Ctrl-C to stop)…"
  docker logs -f "${CONTAINER}"
fi
```

### What changed?

1. **Deeper Doc** – every section now contains granular detail: ADR table, WBS, machine-readable JSON, risk triggers, Action delta, runtime spec.
2. **Script** – flag-driven CLI; UID mapping; auto pull/build; CI network cut-off; detached vs interactive; custom CMD.

You can now:

```bash
chmod +x run_in_container.sh
./run_in_container.sh --help
```

and iterate. Subsequent tasks (image templates, CI workflow change, bats tests) map to the tracking table above.