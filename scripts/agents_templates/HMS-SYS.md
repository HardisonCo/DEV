# HMS-SYS: Core System Infrastructure

This AGENTS.md file provides specific guidance for working with the HMS-SYS component, which implements the core system infrastructure.

## 1. COMPONENT OVERVIEW

HMS-SYS (Core System Infrastructure) is responsible for:
- Providing foundational infrastructure services
- Managing system reliability and scaling
- Implementing service mesh architecture
- Supporting microservices communication
- Ensuring system security and monitoring

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Go**: Main implementation language
- **Kubernetes**: Container orchestration
- **Docker**: Containerization
- **Prometheus/Grafana**: Monitoring
- **Service mesh technologies**: Network communication

### Key Dependencies
- See `go.mod` and `go.sum` for Go dependencies
- Kubernetes manifests and resources
- Infrastructure as code components
- Monitoring and observability tools

## 3. DIRECTORY STRUCTURE

- **cmd/**: Command-line applications
- **pkg/**: Reusable packages
- **internal/**: Internal implementation
- **api/**: API definitions
- **deploy/**: Deployment manifests
- **docs/**: Documentation
- **test/**: Test suites
- **hack/**: Scripts and tools
- **vendor/**: Vendored dependencies

## 4. DEVELOPMENT GUIDELINES

### Go Best Practices
- Follow standard Go idioms and patterns
- Implement proper error handling
- Use interfaces for abstraction
- Document exported functions and types
- Write thorough tests for all components

### Infrastructure Design
- Design for high reliability
- Implement proper monitoring
- Support horizontal scaling
- Document deployment requirements
- Consider security at every layer

### Operational Considerations
- Implement proper logging
- Design for observability
- Plan for disaster recovery
- Document operational procedures
- Consider performance bottlenecks

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Build Go code
make build

# Run tests
make test

# Generate code
make generate

# Verify code quality
make verify

# Deploy to development
make deploy-dev
```

### Kubernetes Operations
```bash
# Apply Kubernetes manifests
make k8s-apply

# Check deployment status
make k8s-status

# Update configuration
make k8s-update-config
```

## 6. TROUBLESHOOTING

### Common Issues
- **Network Connectivity**: Check service mesh configuration
- **Resource Constraints**: Monitor CPU/memory usage
- **Configuration Issues**: Verify environment variables and configs
- **Service Discovery**: Check DNS and service registration

### Debugging
- Review system logs
- Check monitoring dashboards
- Use distributed tracing
- Inspect service mesh telemetry

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced service mesh architecture
- Improved monitoring and alerting
- Kubernetes integration enhancements
- Security hardening measures

### Current Focus Areas
- Performance optimization
- Enhanced observability
- Advanced security features
- Improved deployment automation

## 8. INTEGRATION WITH OTHER COMPONENTS

- **All HMS components**: Core infrastructure provider
- **HMS-API**: API gateway integration
- **HMS-CDF**: Policy-driven infrastructure
- **HMS-MCP**: Model context infrastructure

## 9. AI ASSISTANT GUIDELINES

When working with HMS-SYS:
- Understand the infrastructure architecture before making changes
- Consider reliability implications for all modifications
- Review security considerations thoroughly
- Test changes across different deployment scenarios
- Document operational requirements clearly
- Consider backward compatibility for infrastructure changes
- Be mindful of performance implications for core services