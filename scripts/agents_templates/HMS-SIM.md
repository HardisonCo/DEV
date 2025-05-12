# HMS-SIM: Simulation Environment

This AGENTS.md file provides specific guidance for working with the HMS-SIM component, which implements simulation and testing environments.

## 1. COMPONENT OVERVIEW

HMS-SIM (Simulation Environment) is responsible for:
- Providing simulation frameworks for testing
- Implementing environment models for agent training
- Supporting scenario-based testing
- Facilitating system behavior validation
- Enabling controlled experimentation

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **PyTest**: Testing framework
- **Simulation libraries**: Domain-specific simulation tools
- **Visualization tools**: For simulation results

### Key Dependencies
- See `pyproject.toml` for complete Python dependencies
- Domain-specific simulation libraries
- Data generation and validation tools
- Visualization frameworks

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **environments/**: Simulation environments
  - **agents/**: Agent implementations for simulation
  - **scenarios/**: Predefined testing scenarios
  - **metrics/**: Evaluation metrics
  - **visualizers/**: Result visualization tools
- **tests/**: Test suites
- **examples/**: Example simulations
- **notebooks/**: Jupyter notebooks for analysis
- **data/**: Reference data for simulations

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Use type annotations consistently
- Follow PEP 8 style guidelines
- Document functions with docstrings
- Implement proper error handling
- Write tests for simulation components

### Simulation Design
- Create reproducible simulations
- Document simulation parameters
- Implement proper randomization controls
- Support deterministic execution modes
- Provide evaluation metrics

### Integration Points
- Define clear interfaces for simulated components
- Document external system dependencies
- Support recording and playback of interactions
- Provide mock implementations where appropriate

## 5. COMMON OPERATIONS

### Running Simulations
```bash
# Run a basic simulation
python -m hms_sim.run --scenario=basic

# Run a simulation with specific parameters
python -m hms_sim.run --scenario=advanced --params=params.json

# Evaluate simulation results
python -m hms_sim.evaluate --results=results.json
```

### Development Tasks
```bash
# Run tests
pytest

# Generate documentation
make docs

# Build package
python -m build
```

## 6. TROUBLESHOOTING

### Common Issues
- **Reproducibility Problems**: Check seed values and randomization
- **Performance Issues**: Monitor resource usage during simulations
- **Integration Failures**: Verify component interfaces
- **Data Consistency**: Check simulation state management

### Debugging
- Enable verbose logging
- Use visualization tools to inspect simulation state
- Run simplified scenarios to isolate issues
- Compare against reference results

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced environment models
- Improved reproducibility controls
- Added new scenario templates
- Enhanced visualization tools

### Current Focus Areas
- Multi-agent simulation capabilities
- Advanced scenario generation
- Performance optimization
- Enhanced metrics and analysis

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-A2A**: Agent communication protocols
- **HMS-CDF**: Policy framework for simulation
- **HMS-MCP**: Model context management
- **HMS-LLM**: Language model integration

## 9. AI ASSISTANT GUIDELINES

When working with HMS-SIM:
- Understand simulation parameters before making changes
- Consider reproducibility requirements
- Document simulation scenarios thoroughly
- Ensure deterministic behavior when required
- Test across different configurations
- Be mindful of resource usage for complex simulations
- Validate simulation results against expected behavior