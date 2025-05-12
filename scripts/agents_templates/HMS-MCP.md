# HMS-MCP: Model Context Protocol

This AGENTS.md file provides specific guidance for working with the HMS-MCP component, which implements the Model Context Protocol.

## 1. COMPONENT OVERVIEW

HMS-MCP (Model Context Protocol) is responsible for:
- Defining standardized protocols for model context management
- Implementing consistent interfaces for LLM interactions
- Optimizing context window usage
- Providing tools for context compression and management
- Supporting cross-model compatibility

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **Rust**: Performance-critical components (via FFI)
- **uv**: Python dependency management

### Key Dependencies
- See `pyproject.toml` for complete Python dependencies
- LangChain integration components
- Rust FFI libraries for performance-critical operations

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **protocol/**: Core protocol definitions
  - **adapters/**: Model-specific adapters
  - **utils/**: Utility functions
  - **compression/**: Context compression tools
- **tests/**: Test suites
- **examples/**: Example implementations
- **docs/**: Documentation
- **bindings/**: Language bindings (Rust, etc.)

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Use type annotations consistently
- Follow PEP 8 style guidelines
- Document functions with docstrings
- Implement proper error handling
- Write tests for all protocol components

### Protocol Design
- Maintain backward compatibility where possible
- Document breaking changes clearly
- Provide migration paths for updates
- Ensure consistent behavior across models
- Consider performance implications

### Integration Points
- Standardize interfaces for model interactions
- Document requirements for new model adapters
- Implement validation for protocol compliance
- Support versioning for protocol evolution

## 5. COMMON OPERATIONS

### Basic Usage
```python
from hms_mcp import ModelContext

# Create a context manager
context = ModelContext()

# Add content to the context
context.add("User query: How does photosynthesis work?")

# Get optimized context for a specific model
optimized = context.optimize(model="claude-3")
```

### Development Tasks
```bash
# Run tests
pytest

# Build documentation
cd docs && make html

# Create a new adapter
python -m tools.create_adapter --model=new-model-name
```

## 6. TROUBLESHOOTING

### Common Issues
- **Context Overflow**: Exceeding model token limits
- **Adapter Compatibility**: Issues with specific models
- **Performance Bottlenecks**: Slow context processing
- **Protocol Version Mismatches**: Different components using different protocol versions

### Debugging
- Enable verbose logging
- Test with simplified contexts
- Verify token counting accuracy
- Check adapter configurations

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced compression algorithms
- Support for newer model architectures
- Improved performance for large contexts
- Extended protocol specification

### Current Focus Areas
- Multi-modal context support
- Enhanced cross-model compatibility
- Further optimized compression
- Extended validation tools

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-LLM**: Model integration interfaces
- **HMS-A2A**: Agent-to-agent communication
- **HMS-BOT**: Conversational applications
- **HMS-RAG**: Retrieval-augmented generation

## 9. AI ASSISTANT GUIDELINES

When working with HMS-MCP:
- Understand the protocol specifications thoroughly before making changes
- Consider backward compatibility when modifying interfaces
- Test across multiple model types for compatibility
- Be mindful of performance implications for context operations
- Document protocol-specific behaviors
- Validate edge cases for context handling