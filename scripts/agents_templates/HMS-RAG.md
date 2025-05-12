# HMS-RAG: Retrieval-Augmented Generation

This AGENTS.md file provides specific guidance for working with the HMS-RAG component, which implements retrieval-augmented generation capabilities.

## 1. COMPONENT OVERVIEW

HMS-RAG (Retrieval-Augmented Generation) is responsible for:
- Implementing advanced retrieval techniques for LLMs
- Managing document indexing and chunking
- Optimizing retrieval quality and relevance
- Supporting context-aware generation
- Providing evaluation tools for RAG quality

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **TypeScript/JavaScript**: Frontend implementation
- **Python**: Backend retrieval components
- **Next.js**: Frontend framework
- **Docker**: Containerization

### Key Dependencies
- See `package.json` for frontend dependencies
- Backend dependencies in Python packages
- Vector database integrations
- Embedding models

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **components/**: React components
  - **pages/**: Next.js pages
  - **lib/**: Shared libraries
  - **styles/**: CSS and styling
  - **utils/**: Utility functions
- **backend/**: Python retrieval components
- **public/**: Static assets
- **tests/**: Test suites
- **docker/**: Docker configuration

## 4. DEVELOPMENT GUIDELINES

### Frontend Best Practices
- Use TypeScript for type safety
- Follow React/Next.js patterns
- Implement responsive designs
- Use component composition
- Follow established code style (ESLint)

### Retrieval Design
- Document chunking strategies
- Implement proper embedding generation
- Optimize retrieval relevance
- Support hybrid retrieval approaches
- Document evaluation methodologies

### RAG-Specific Considerations
- Balance retrieval precision and recall
- Implement proper context management
- Consider token limitations
- Support metadata filtering
- Implement result caching where appropriate

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

### Docker Operations
```bash
# Build Docker image
docker-compose build

# Run containerized application
docker-compose up
```

## 6. TROUBLESHOOTING

### Common Issues
- **Retrieval Relevance**: Check embedding models and chunking
- **Performance Issues**: Monitor vector search performance
- **Context Limitations**: Check for context overflows
- **Integration Problems**: Verify API configurations

### Debugging
- Review retrieval logs for relevance
- Test individual components in isolation
- Monitor embedding generation
- Check vector database queries

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Improved chunking strategies
- Enhanced embedding models
- Better evaluation metrics
- Support for hybrid retrieval

### Current Focus Areas
- Retrieval performance optimization
- Multi-document context management
- Enhanced evaluation tools
- Advanced retrieval techniques (multi-vector, etc.)

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-LLM**: Language model integration
- **HMS-MCP**: Context protocol integration
- **HMS-BOT**: Conversational application integration
- **HMS-NFO**: Indexing and search services

## 9. AI ASSISTANT GUIDELINES

When working with HMS-RAG:
- Understand retrieval fundamentals before modifying components
- Consider embedding model characteristics
- Be aware of chunking impacts on retrieval quality
- Test thoroughly with diverse queries
- Monitor and optimize retrieval performance
- Document retrieval strategies clearly
- Consider the balance between retrieval precision and recall