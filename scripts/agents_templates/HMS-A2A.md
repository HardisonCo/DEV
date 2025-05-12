# HMS-A2A: AI Agent-to-Agent Communication

This AGENTS.md file provides specific guidance for working with the HMS-A2A component, which implements agent-to-agent communication protocols and frameworks.

## 1. COMPONENT OVERVIEW

HMS-A2A (AI Agent-to-Agent Communication) is responsible for:
- Facilitating structured communication between AI agents
- Implementing agent coordination protocols
- Providing domain-specific agent implementations
- Supporting economic models and verification frameworks
- Enabling cross-agency information exchange

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **Poetry/uv**: Dependency management
- **LangChain/MCP**: For agent communication frameworks
- **Jupyter Notebooks**: For interactive analysis and demonstrations

### Key Dependencies
- See `pyproject.toml` for complete Python dependencies
- Specialized mathematical libraries for theorem proving
- Integration with core MCP protocol

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **core/**: Core framework components
  - **agents/**: Agent implementations
  - **domains/**: Domain-specific modules
  - **common/**: Common utilities
  - **schemas/**: Schema definitions
- **data/**: Data files including economic domain models
- **notebooks/**: Jupyter notebooks for demonstrations
- **utils/**: Utility scripts
- **deployment/**: Deployment configurations
- **scripts/**: Utility scripts for maintenance

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Use type annotations consistently
- Follow PEP 8 style guidelines
- Document functions with docstrings
- Implement proper error handling
- Write tests for core functionality

### Integration Points
- Agents communicate through structured protocols
- Economic domain models interface with HMS-CDF policies
- Verification frameworks ensure agent behavior compliance
- Inter-agency protocols coordinate with external systems

### Agent Communication
- Follow the established communication protocols
- Use standardized message formats
- Implement proper error handling and fallbacks
- Document message schemas clearly

## 5. COMMON OPERATIONS

### Running the System
```bash
# Start the main system
./start.sh

# Run the CORT economic demo
./start_cort_demo.sh

# Run lean tests
./run_lean_tests.sh
```

### Migration and Cleanup
```bash
# Clean up migration artifacts
python cleanup_migration.py

# Reorganize folders according to new structure
python reorganize_folders.py
```

## 6. TROUBLESHOOTING

### Common Issues
- **Protocol Mismatches**: Ensure all agents use compatible protocol versions
- **Dependency Conflicts**: Check for conflicts in pyproject.toml
- **Model Context Overflows**: Optimize context usage in agent communications
- **Economic Model Validation**: Validate against formal specifications

### Debugging
- Check logs for detailed error information
- Use the theorem exporter for validation of mathematical proofs
- Examine economic domain models for inconsistencies
- Review integration points with other HMS components

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Integration of Moneyball/Buffett economic approach
- Enhanced communication protocols between agents
- Migration to new folder structure
- Implementation of mathematical agent

### Current Focus Areas
- Prover integration
- CORT economic integration
- Recursive thought patterns
- Cross-agency certificate system implementation

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-CDF**: Policy data and economic models
- **HMS-MCP**: Model context protocol integration
- **HMS-NFO**: Information indexing for agent knowledge
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-A2A:
- Understand the agent communication protocols before modifying
- Be aware of the mathematical foundations of economic models
- Consider validation requirements for agent interactions
- Follow the established migration patterns
- Test thoroughly, especially cross-agent communications