# codex-cli: TypeScript CLI Implementation

This AGENTS.md file provides specific guidance for working with the codex-cli component, which implements the CLI in TypeScript.

## 1. COMPONENT OVERVIEW

codex-cli is responsible for:
- Implementing the TypeScript version of the CLI
- Providing a terminal user interface
- Managing model interactions
- Supporting command execution
- Implementing configuration management

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **TypeScript**: Type-safe JavaScript
- **Node.js**: Runtime environment
- **Ink**: Terminal UI built on React
- **ESM**: ES Modules

### Key Dependencies
- See `package.json` for complete dependencies
- React and Ink for terminal UI
- Various utility libraries

## 3. DIRECTORY STRUCTURE

- **bin/**: Executable scripts
- **examples/**: Example implementations
- **scripts/**: Utility scripts
- **src/**: Main source code
  - **app.tsx**: Main application
  - **cli.tsx**: Command-line interface
  - **format-command.ts**: Command formatting
  - **parse-apply-patch.ts**: Patch parsing and application
  - **text-buffer.ts**: Text buffer management
- **tests/**: Test suites

## 4. DEVELOPMENT GUIDELINES

### TypeScript Best Practices
- Use strict typing consistently
- Follow established patterns for React/Ink components
- Implement proper error handling
- Document interfaces and functions
- Use ESM modules

### Command Execution
- Implement proper security checks
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
# Install dependencies
npm install

# Build the project
npm run build

# Run tests
npm test

# Run with specific options
npm start -- --option=value

# Build container
./scripts/build_container.sh
```

### Container Usage
```bash
# Run in container
./scripts/run_in_container.sh

# Stage a release
./scripts/stage_release.sh
```

## 6. TROUBLESHOOTING

### Common Issues
- **Build Errors**: Check TypeScript types and dependencies
- **Runtime Errors**: Check logs and error messages
- **Model Connectivity**: Verify API credentials and connectivity
- **Terminal Display**: Check terminal compatibility

### Debugging
- Enable verbose logging
- Test components in isolation
- Check configuration settings
- Verify terminal capabilities

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Migration to AGENTS.md from codex.md
- Support for reasoning messages
- Improved error handling
- Enhanced multiline input

### Current Focus Areas
- Performance optimization
- Enhanced model provider support
- Improved terminal compatibility
- Advanced UI features

## 8. INTEGRATION WITH OTHER COMPONENTS

- **codex-rs**: Rust CLI counterpart
- **HMS-MCP**: Model context protocol
- **HMS-LLM**: Language model interfaces
- **HMS-SYS**: Core system integration

## 9. AI ASSISTANT GUIDELINES

When working with codex-cli:
- Follow the established React/Ink patterns for components
- Maintain TypeScript type safety
- Be aware of terminal compatibility considerations
- Test thoroughly across different environments
- Consider backward compatibility for configuration
- Document interfaces clearly
- Be mindful of performance in terminal applications