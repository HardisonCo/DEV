# AGENTS.md - Multi-component Repository Guidelines

This AGENTS.md file provides essential guidelines for working with this multi-language repository comprising Rust, TypeScript, PHP, Python, Clojure, and Vue.js codebases. It serves as a comprehensive reference for both human developers and AI assistants.

## 1. INTRODUCTION & PURPOSE

This file provides essential information and guidelines for:
- Understanding the overall architecture and component relationships
- Navigating the multi-language codebase efficiently
- Following established coding conventions across languages
- Avoiding common pitfalls during development
- Accessing critical resources for each component

## 2. REPOSITORY STRUCTURE

This repository consists of two main sections:
1. Core CLI tools implemented in Rust (`codex-rs`) and TypeScript (`codex-cli`)
2. System components (`SYSTEM_COMPONENTS/`) with multiple language-specific implementations

### Core CLI Tools
- `codex-rs/`: The Rust implementation of the CLI
- `codex-cli/`: The TypeScript implementation of the CLI

### System Components
The `SYSTEM_COMPONENTS/` directory contains multiple modules:
- `HMS-A2A`: AI agent-to-agent communication (Python)
- `HMS-API`: Backend API services (PHP/Laravel)
- `HMS-BOT`: Conversational AI components (Python)
- `HMS-CDF`: Framework for policy and data (Rust/Python)
- `HMS-EMR`: Medical record integration (Go)
- `HMS-ETL`: Data pipeline and transformation (Python)
- `HMS-GOV`: Governance and compliance (Vue.js)
- `HMS-LLM`: Language model integration
- `HMS-MCP`: Model context protocol
- `HMS-MFE`: Micro-frontend framework (Vue.js)
- `HMS-MKT`: Marketplace functionality (Vue.js/Nuxt)
- `HMS-NFO`: Information processing and indexing (Clojure)
- `HMS-RAG`: Retrieval-augmented generation
- `HMS-RED`: API module
- `HMS-SIM`: Simulation
- `HMS-SYS`: Core system infrastructure
- `HMS-UTL`: Utilities

## 3. TECHNOLOGY STACK

### Rust (codex-rs)
- Core functionality implemented using Rust 2024 Edition
- Strict error handling (avoids unwrap)
- Workspace structure with multiple crates
- Key dependencies: tokio for async

### TypeScript (codex-cli)
- Node.js implementation with strict TypeScript
- React and Ink for terminal UI
- Uses ESM modules

### PHP (HMS-API)
- Laravel-based API framework
- Follows Laravel conventions for routes, controllers, and models
- Uses Composer for dependency management

### Python (HMS-A2A, HMS-BOT, HMS-ETL)
- Mix of Poetry and pip for dependency management
- Emphasis on asyncio for asynchronous operations
- Type annotations for improved code quality

### Clojure (HMS-NFO)
- Used for search indexing and information processing
- Functional programming patterns
- Uses Leiningen for project management

### Vue.js (HMS-GOV, HMS-MFE)
- Nuxt.js framework for some components
- Component-based architecture
- TypeScript for type safety

## 4. CRITICAL GUIDELINES

### Rust Code
- Never add or modify any code related to `CODEX_SANDBOX_NETWORK_DISABLED_ENV_VAR`. This environment variable is set in sandbox environments where network access is intentionally restricted. Any existing code that uses this variable accounts for these restrictions.
- Follow the workspace structure when adding new functionality
- Respect the strict error handling patterns (avoid unwrap, expect)
- Use tokio for async operations

### TypeScript/JavaScript
- Use ESM modules consistently
- Follow the established patterns for React components
- Maintain strict TypeScript typing

### PHP/Laravel
- Follow Laravel conventions for file organization
- Use dependency injection patterns consistently
- Maintain proper database migrations

### Python
- Use type annotations consistently
- Follow the established async patterns
- Respect the dependency management approach of each module (Poetry vs pip)

### Clojure
- Maintain the functional programming style
- Follow the established data processing patterns

### Vue.js
- Keep components small and focused
- Follow the established state management patterns
- Use TypeScript for components

## 5. INTEGRATION POINTS

The repository components integrate through several mechanisms:
- API interfaces defined in HMS-API
- Model context protocol (MCP) for AI interactions
- Event-driven communication patterns
- Shared data formats and schemas

## 6. DEVELOPMENT WORKFLOW

1. Understand the component architecture before making changes
2. Use the appropriate language-specific tooling
3. Test changes thoroughly in isolation
4. Verify cross-component integration
5. Update documentation as needed

## 7. MAINTENANCE & UPDATES

- Regular dependency updates follow semver guidelines
- Major architectural changes require cross-component coordination
- Documentation should be updated alongside code changes

## 8. HISTORICAL CONTEXT

The repository has evolved through several key architectural changes:
- Migration from codex.md to AGENTS.md (2b122da, 3104d81)
- Addition of MCP protocol for model interactions
- Integration of multi-language components under a unified structure

## 9. AI ASSISTANT GUIDELINES

When working with this codebase:
- Respect the language-specific conventions of each component
- Use the appropriate tools for each language (cargo, npm, composer, etc.)
- Be aware of cross-component dependencies
- Consider the sandbox environment limitations, especially for network operations