# codex-rs: Rust CLI Implementation

This AGENTS.md file provides specific guidance for working with the codex-rs component, which implements the CLI in Rust.

## 1. COMPONENT OVERVIEW

codex-rs is responsible for:
- Implementing the Rust version of the CLI
- Providing a terminal user interface
- Managing model interactions
- Supporting sandboxed command execution
- Implementing configuration management

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Rust**: 2024 Edition
- **Tokio**: Async runtime
- **Cargo**: Dependency management
- **Various Rust crates**: For specific functionality

### Key Dependencies
- See `Cargo.toml` for complete Rust dependencies
- Workspace structure with multiple crates
- Core functionality separated into dedicated crates

## 3. DIRECTORY STRUCTURE

- **ansi-escape/**: ANSI terminal handling
- **apply-patch/**: File patching utilities
- **cli/**: Command-line interface
- **common/**: Shared utilities
- **core/**: Core functionality
- **docs/**: Documentation
- **exec/**: Command execution
- **execpolicy/**: Execution policy implementation
- **mcp-client/**: Model context protocol client
- **mcp-server/**: Model context protocol server
- **mcp-types/**: Model context protocol types
- **tui/**: Terminal user interface

## 4. DEVELOPMENT GUIDELINES

### Rust Best Practices
- Never add or modify any code related to `CODEX_SANDBOX_NETWORK_DISABLED_ENV_VAR`. This environment variable is set in sandbox environments where network access is intentionally restricted. Any existing code that uses this variable accounts for these restrictions.
- Follow Rust's ownership and borrowing rules
- Use proper error handling with Result types
- Avoid unwrap() in production code (it's specifically denied in the lints)
- Document public interfaces with rustdoc
- Follow the established crate structure

### Command Execution
- Implement proper sandbox security
- Handle command timeouts appropriately
- Consider permission models for operations
- Validate inputs before execution

### Model Interaction
- Handle API errors gracefully
- Implement proper retry mechanisms
- Support various model providers
- Manage context window efficiently

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Build the project
cargo build

# Run tests
cargo test

# Run with specific features
cargo run --features=feature_name

# Check code quality
cargo clippy
```

### Using the Just Command Runner
```bash
# List available commands
just --list

# Run a specific command
just command_name
```

## 6. TROUBLESHOOTING

### Common Issues
- **Compilation Errors**: Check Rust version and dependencies
- **Runtime Errors**: Check logs and error messages
- **Model Connectivity**: Verify API credentials and connectivity
- **Command Execution**: Check sandbox configuration

### Debugging
- Use debug builds for additional information
- Check logs for detailed error messages
- Test individual components in isolation
- Verify configuration files

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Added support for AGENTS.md in Rust CLI
- Sandbox network disabling
- Support for reasoning messages
- Improved model context protocol

### Current Focus Areas
- Enhanced model provider support
- Improved error handling
- Performance optimization
- Advanced sandbox features

## 8. INTEGRATION WITH OTHER COMPONENTS

- **codex-cli**: TypeScript CLI counterpart
- **HMS-MCP**: Model context protocol
- **HMS-SYS**: Core system integration
- **HMS-LLM**: Language model interfaces

## 9. AI ASSISTANT GUIDELINES

When working with codex-rs:
- Respect the crate boundaries and workspace structure
- Follow Rust best practices, especially around error handling
- Be aware of sandbox restrictions for network access
- Test thoroughly across different operating systems
- Consider backward compatibility for configuration
- Document public interfaces clearly
- Be mindful of memory safety and performance