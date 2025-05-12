# Codex Customization Guide

This document outlines the various ways to customize your Codex experience, based on the official documentation.

## 1. Configuration Files

You can customize Codex by creating configuration files in the `~/.codex/` directory. Codex supports both YAML and JSON formats.

### Basic Configuration Example (YAML)

Create `~/.codex/config.yaml`:

```yaml
model: o4-mini
approvalMode: suggest
fullAutoErrorMode: ask-user
notify: true
```

### Basic Configuration Example (JSON)

Create `~/.codex/config.json`:

```json
{
  "model": "o4-mini",
  "approvalMode": "suggest",
  "fullAutoErrorMode": "ask-user",
  "notify": true
}
```

## 2. Key Configuration Parameters

| Parameter | Type | Default | Description | Options |
|-----------|------|---------|-------------|---------|
| model | string | o4-mini | AI model to use | Any model supporting OpenAI API |
| approvalMode | string | suggest | Permission mode | suggest, auto-edit, full-auto |
| fullAutoErrorMode | string | ask-user | Error handling in full-auto | ask-user, ignore-and-continue |
| notify | boolean | true | Desktop notifications | true/false |

## 3. Custom AI Providers

You can configure multiple AI service providers in the `providers` section:

```json
{
  "model": "o4-mini",
  "provider": "openai",
  "providers": {
    "openai": {
      "name": "OpenAI",
      "baseURL": "https://api.openai.com/v1",
      "envKey": "OPENAI_API_KEY"
    },
    "azure": {
      "name": "AzureOpenAI",
      "baseURL": "https://YOUR_PROJECT_NAME.openai.azure.com/openai",
      "envKey": "AZURE_OPENAI_API_KEY"
    },
    "mistral": {
      "name": "Mistral",
      "baseURL": "https://api.mistral.ai/v1",
      "envKey": "MISTRAL_API_KEY"
    },
    "ollama": {
      "name": "Ollama",
      "baseURL": "http://localhost:11434/v1",
      "envKey": "OLLAMA_API_KEY"
    }
  }
}
```

## 4. History Configuration

Control conversation history settings:

```json
{
  "history": {
    "maxSize": 1000,
    "saveHistory": true,
    "sensitivePatterns": []
  }
}
```

## 5. Custom Instructions with AGENTS.md

Create project-level guidance using AGENTS.md files in various locations:

- `~/.codex/AGENTS.md`: Personal global guidance
- `AGENTS.md` at repo root: Shared project notes
- `AGENTS.md` in the current working directory: Sub-folder specifics

Codex merges these files top-down, with personal settings taking precedence.

## 6. Approval Modes

Customize autonomy levels with `--approval-mode` flag:

- `suggest` (default): Agent can read files but must ask for approval for writes/commands
- `auto-edit`: Agent can read and write files but must ask for shell commands
- `full-auto`: Agent can read/write files and run commands without approval

## 7. Environment Variables

- `OPENAI_API_KEY`: Set your API key
- `DEBUG=true`: Enable verbose logging with full API request/response details
- `CODEX_QUIET_MODE=1`: Silence interactive UI noise in non-interactive mode
- `CODEX_DISABLE_PROJECT_DOC=1`: Disable loading of AGENTS.md files

## 8. Command Line Flags

Key flags for customization:

- `--model/-m`: Specify the model to use
- `--approval-mode/-a`: Set the approval mode
- `--quiet/-q`: Run in non-interactive mode
- `--notify`: Enable desktop notifications
- `--no-project-doc`: Disable loading of AGENTS.md files

## 9. Using Alternate Providers

Switch providers with the `--provider` flag:

```bash
codex --provider azure "explain this code"
```

## 10. Custom Shell Completions

Generate shell completions for your preferred shell:

```bash
codex completion bash > ~/.bash_completion.d/codex
codex completion zsh > ~/.zsh_completion.d/_codex
codex completion fish > ~/.config/fish/completions/codex.fish
```

## 11. Advanced: Docker Sandboxing

For enhanced security on Linux, use Docker sandboxing with:

```bash
./scripts/run_in_container.sh
```

This gives you deterministic, reproducible runs with proper network isolation.

## 12. Debugging & Development

- Set `DEBUG=true` for tracing API requests and responses
- Use `pnpm test:watch` during development for super-fast feedback
- Run `pnpm test && pnpm run lint && pnpm run typecheck` before submitting code