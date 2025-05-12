# HMS-EMR: Electronic Medical Record Integration

This AGENTS.md file provides specific guidance for working with the HMS-EMR component, which handles electronic medical record integration.

## 1. COMPONENT OVERVIEW

HMS-EMR (Electronic Medical Record Integration) is responsible for:
- Managing health data integration
- Implementing FHIR standard compliance
- Ensuring data privacy and security
- Supporting medical data exchange
- Providing clinical data validation

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Go**: Main implementation language
- **Nix**: Reproducible builds and development environment
- **Docker**: Containerization
- **FHIR**: Healthcare data standard

### Key Dependencies
- See `go.mod` and `go.sum` for Go dependencies
- Nix packages defined in `flake.nix`
- TypeScript type generation via `tygo`

## 3. DIRECTORY STRUCTURE

- **cmd/**: Application entry points
- **pkg/**: Reusable packages 
- **internal/**: Internal implementation
- **api/**: API definitions
- **config/**: Configuration
- **test/**: Test suites
- **docs/**: Documentation

## 4. DEVELOPMENT GUIDELINES

### Go Best Practices
- Follow standard Go idioms and patterns
- Use interfaces for abstraction
- Implement proper error handling
- Write tests for all functionality
- Document exported functions and types

### FHIR Integration
- Adhere to FHIR resource schemas
- Implement proper validation
- Support standard FHIR operations
- Document extensions and profiles

### Security Considerations
- Implement HIPAA compliance measures
- Follow secure coding practices
- Properly handle PHI (Protected Health Information)
- Implement access controls and audit logging

## 5. COMMON OPERATIONS

### Development Environment
```bash
# Set up development environment with Nix
nix develop

# Build the application
make build

# Run tests
make test

# Start local server
make run
```

### Docker Operations
```bash
# Build Docker image
docker-compose build

# Run containerized application
docker-compose up
```

## 6. TROUBLESHOOTING

### Common Issues
- **FHIR Validation Errors**: Check resource compliance with standards
- **Authentication Issues**: Verify credential configuration
- **Data Integration Failures**: Check data mapping logic
- **Performance Bottlenecks**: Monitor database queries and API calls

### Debugging
- Use Go's debugging tools
- Check application logs
- Monitor API response codes
- Test individual FHIR resources

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced FHIR compliance
- Improved security measures
- Nix-based development environment
- TypeScript type generation

### Current Focus Areas
- Performance optimization
- Extended FHIR resource support
- Enhanced privacy controls
- Cross-system integration

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: API gateway integration
- **HMS-CDF**: Policy framework for healthcare data
- **HMS-MFE**: Frontend for medical record display
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-EMR:
- Understand FHIR resource models before making changes
- Be conscious of healthcare data privacy requirements
- Follow established validation patterns for medical data
- Test thoroughly across different resource types
- Document healthcare-specific considerations
- Consider backward compatibility for healthcare integrations