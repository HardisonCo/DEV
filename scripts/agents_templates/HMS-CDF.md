# HMS-CDF: Policy and Data Framework

This AGENTS.md file provides specific guidance for working with the HMS-CDF component, which implements the policy lifecycle and data framework.

## 1. COMPONENT OVERVIEW

HMS-CDF (Policy and Data Framework) is responsible for:
- Managing policy lifecycle and workflows
- Implementing legislative and regulatory processes
- Supporting cross-agency data coordination
- Providing debate and voting simulation
- Implementing genetic analysis integration

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Rust**: Primary implementation language
- **Python**: Supporting scripts and domain adapters
- **Cargo**: Rust dependency management
- **Domain-specific languages**: For policy representation

### Key Dependencies
- See `Cargo.toml` for complete Rust dependencies
- Python domain adapters (requirements.txt)
- Cross-domain integration libraries

## 3. DIRECTORY STRUCTURE

- **src/**: Rust source code
- **examples/**: Example implementations for various domains
  - Agency-specific workflow examples
  - Debate simulations
  - Voting models
- **domain_adapters/**: Python adapters for various domains
- **docs/**: Documentation files
- **etl_integration/**: Data integration tools
- **data/**: Sample and production data

## 4. DEVELOPMENT GUIDELINES

### Rust Best Practices
- Follow Rust's ownership and borrowing rules
- Use proper error handling with Result types
- Document functions with rustdoc comments
- Implement tests for core functionality
- Use Rust idioms for memory safety

### Python Integration
- Maintain type hints in Python code
- Follow consistent error handling patterns
- Document API boundaries between Rust and Python
- Test cross-language integration points

### Cross-Agency Integration
- Follow established protocols for data sharing
- Implement proper validation for external data
- Document data schemas thoroughly
- Consider privacy and security implications

## 5. COMMON OPERATIONS

### Running Examples
```bash
# Run the economic legislation demo
./run_economic_legislation_demo.sh

# Run the cross-agency genetic analysis demo
./run_cross_agency_genetic_analysis_demo.sh

# Run the debate demo
./run_debate_demo.sh
```

### Development Tasks
```bash
# Compile Rust code
cargo build

# Run tests
cargo test

# Run Python domain adapter
python run_domain_adapter_demo.py
```

## 6. TROUBLESHOOTING

### Common Issues
- **Rust Compilation Errors**: Check the error messages for specific issues
- **Cross-Domain Integration**: Verify adapter configurations
- **Data Validation Failures**: Check schema compliance
- **Performance Issues**: Monitor resource usage during simulations

### Debugging
- Use Rust's debug builds for detailed information
- Check logs in the implementation trackers
- Review visualizations for data integrity issues
- Use domain-specific debugging tools

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Cross-agency genetic analysis implementation
- Enhanced debate and voting models
- Domain supervisor adapter integration
- Economic model enhancements

### Current Focus Areas
- Meta planning system integration
- Cross-domain coordination improvements
- Visualization enhancements
- Standards integration

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-A2A**: Agent protocol integration
- **HMS-NFO**: Information indexing and search
- **HMS-GOV**: Governance layer interface
- **HMS-SYS**: Core infrastructure integration

## 9. AI ASSISTANT GUIDELINES

When working with HMS-CDF:
- Understand the policy lifecycle model before making changes
- Be aware of cross-agency integration requirements
- Consider validation and verification needs
- Test across multiple domains when making core changes
- Document domain-specific considerations
- Be conscious of performance implications for simulations