# HMS-RED: API Module

This AGENTS.md file provides specific guidance for working with the HMS-RED component, which implements the API module.

## 1. COMPONENT OVERVIEW

HMS-RED (API Module) is responsible for:
- Implementing standardized API interfaces
- Managing API versioning and compatibility
- Providing authentication and authorization
- Supporting scalable API operations
- Ensuring API security and compliance

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **TypeScript**: Main implementation language
- **Node.js**: Runtime environment
- **Drizzle ORM**: Database toolkit
- **Jest**: Testing framework
- **Docker**: Containerization

### Key Dependencies
- See `package.json` for complete dependencies
- Drizzle ORM for database operations
- Authentication libraries
- Validation frameworks

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **api/**: API route handlers
  - **auth/**: Authentication and authorization
  - **db/**: Database models and migrations
  - **middleware/**: Express middleware
  - **services/**: Business logic services
  - **utils/**: Utility functions
- **tests/**: Test suites
  - **unit/**: Unit tests
  - **integration/**: Integration tests
- **config/**: Configuration files
- **scripts/**: Utility scripts

## 4. DEVELOPMENT GUIDELINES

### TypeScript Best Practices
- Use strict typing consistently
- Document interfaces and types
- Follow established naming conventions
- Implement proper error handling
- Use async/await for asynchronous operations

### API Design
- Follow RESTful design principles
- Document API endpoints with OpenAPI/Swagger
- Implement proper validation
- Support versioning for breaking changes
- Use consistent error formats

### Database Operations
- Use Drizzle ORM for database interactions
- Implement migrations for schema changes
- Use transactions for related operations
- Consider performance for frequent queries
- Implement proper data validation

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Run tests
npm run test

# Run migrations
npm run db:migrate

# Build for production
npm run build
```

### API Documentation
```bash
# Generate API documentation
npm run docs:generate

# Serve documentation locally
npm run docs:serve
```

## 6. TROUBLESHOOTING

### Common Issues
- **Authentication Failures**: Check token configuration
- **Database Connectivity**: Verify connection settings
- **API Versioning Conflicts**: Check client version support
- **Performance Bottlenecks**: Monitor frequently used endpoints

### Debugging
- Check server logs for errors
- Use API testing tools (Postman, etc.)
- Monitor database query performance
- Test endpoints in isolation

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Migration to Drizzle ORM
- Enhanced authentication security
- Improved API documentation
- Performance optimizations

### Current Focus Areas
- Advanced caching strategies
- Enhanced authorization controls
- API gateway integration
- Cross-service communication

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: Core API backbone integration
- **HMS-MFE**: Frontend service consumption
- **HMS-CDF**: Policy-driven API controls
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-RED:
- Follow the established API design patterns
- Maintain backward compatibility when possible
- Document API changes thoroughly
- Consider security implications for all endpoints
- Test endpoints with various authentication scenarios
- Be mindful of performance for frequently used endpoints
- Follow the established error handling patterns