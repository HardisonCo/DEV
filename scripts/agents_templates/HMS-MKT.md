# HMS-MKT: Marketplace of Capabilities

This AGENTS.md file provides specific guidance for working with the HMS-MKT component, which implements the marketplace of capabilities.

## 1. COMPONENT OVERVIEW

HMS-MKT (Marketplace of Capabilities) is responsible for:
- Providing a platform for sharing and discovering capabilities
- Managing capability registration and discovery
- Implementing marketplace UI and functionality
- Supporting capability integration
- Facilitating cross-component capability sharing

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **JavaScript/TypeScript**: Main implementation languages
- **Vue.js/Nuxt.js**: Frontend framework
- **Jest**: Testing framework
- **ESLint**: Code quality

### Key Dependencies
- See `package.json` for complete dependencies
- Nuxt.js modules and extensions
- Testing libraries (Jest, Vitest)
- State management solutions

## 3. DIRECTORY STRUCTURE

- **assets/**: Static assets
- **components/**: Vue components
- **layouts/**: Page layouts
- **middleware/**: Nuxt middleware
- **pages/**: Page components and routing
- **plugins/**: Nuxt plugins
- **store/**: State management
- **utils/**: Utility functions
- **test/**: Test files
- **static/**: Static files served at root

## 4. DEVELOPMENT GUIDELINES

### Vue/Nuxt Best Practices
- Use composition API for components
- Follow Nuxt.js directory structure conventions
- Maintain TypeScript type safety
- Implement responsive design principles
- Follow established component architecture

### Marketplace Specific Guidelines
- Implement standard capability interfaces
- Document capability requirements
- Support versioning for capabilities
- Implement proper discovery mechanisms
- Consider security for capability execution

### Testing Requirements
- Write unit tests for components and services
- Test capability integration points
- Verify marketplace functionality
- Include security testing where appropriate

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Run tests
npm run test
```

### Marketplace Operations
```bash
# Register a new capability
npm run register-capability -- --name=mycapability --version=1.0.0

# Test a capability
npm run test-capability -- --name=mycapability
```

## 6. TROUBLESHOOTING

### Common Issues
- **Capability Registration Failures**: Check interface compliance
- **Discovery Issues**: Verify metadata and indices
- **Integration Problems**: Check capability interfaces
- **Performance Bottlenecks**: Monitor marketplace queries

### Debugging
- Use Vue DevTools for component inspection
- Check browser console for errors
- Monitor network requests for API calls
- Test capabilities in isolation

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced capability discovery
- Improved marketplace UI
- Added capability versioning
- Enhanced security features

### Current Focus Areas
- Performance optimization
- Enhanced search functionality
- Improved capability integration
- Cross-component capability sharing

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: Backend services for marketplace
- **HMS-MFE**: UI component library
- **HMS-CDF**: Policy framework for capabilities
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-MKT:
- Understand capability interfaces before making changes
- Follow the established marketplace patterns
- Consider security implications for capabilities
- Test integration points thoroughly
- Document capability requirements clearly
- Maintain backwards compatibility where possible
- Consider performance for marketplace operations