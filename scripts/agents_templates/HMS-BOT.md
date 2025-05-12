# HMS-BOT: Conversational AI Components

This AGENTS.md file provides specific guidance for working with the HMS-BOT component, which implements conversational AI capabilities.

## 1. COMPONENT OVERVIEW

HMS-BOT is responsible for:
- Building and managing conversational AI agents
- Implementing natural language understanding capabilities
- Managing knowledge retrieval and RAG functionality
- Processing user queries and generating responses
- Integrating with external language models

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **Poetry**: Dependency management
- **LangChain**: AI framework for LLM applications
- **Vercel/Next.js**: Frontend interface (when applicable)
- **LangSmith**: Evaluation and monitoring

### Key Dependencies
- See `pyproject.toml` for complete Python dependencies
- LangChain and related libraries
- Vector database connections
- Frontend dependencies in `frontend/package.json`

## 3. DIRECTORY STRUCTURE

- **backend/**: Server-side code
  - **configuration.py**: System configuration
  - **embeddings.py**: Vector embedding functionality
  - **ingest.py**: Data ingestion
  - **parser.py**: Content parsing
  - **retrieval.py**: Document retrieval
  - **utils.py**: Utility functions
- **frontend/**: Frontend interface (Next.js)
- **_scripts/**: Evaluation and utility scripts
- **assets/**: Static assets
- **terraform/**: Infrastructure as code

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Use type annotations consistently
- Follow PEP 8 style guidelines
- Document functions with docstrings
- Implement proper error handling
- Use async patterns where appropriate

### Integration Points
- Language model providers (OpenAI, Anthropic, etc.)
- Vector databases for embeddings
- Knowledge bases for retrieval
- Frontend interfaces

### Retrieval-Augmented Generation (RAG)
- Follow established patterns for document ingestion
- Implement proper chunking strategies
- Optimize embedding models for domain-specific content
- Implement evaluation metrics for retrieval quality

## 5. COMMON OPERATIONS

### Running Locally
```bash
# Set up the environment
poetry install

# Ingest documents
python -m backend.ingest

# Run the frontend
cd frontend && npm run dev
```

### Evaluation
```bash
# Evaluate chains
python _scripts/evaluate_chains.py

# Evaluate with improvements
python _scripts/evaluate_chains_improved_chain.py
```

## 6. TROUBLESHOOTING

### Common Issues
- **API Key Issues**: Check environment variables
- **Embedding Errors**: Verify vector database connection
- **Memory Usage**: Monitor embedding process resource usage
- **Model Context Limits**: Check for context overflow

### Debugging
- Review logs for detailed error information
- Use LangSmith for tracing conversation chains
- Check frontend console for UI-related issues
- Verify infrastructure setup in terraform

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Integration with LangSmith for evaluation
- Enhanced retrieval mechanisms
- Improved conversation management
- Frontend interface updates

### Current Focus Areas
- Chain evaluation and optimization
- Production deployment improvements
- Multi-model support
- Enhanced context management

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-MCP**: Model context protocol
- **HMS-NFO**: Search indices for retrieval
- **HMS-RAG**: Advanced retrieval techniques
- **HMS-MFE**: Frontend integration

## 9. AI ASSISTANT GUIDELINES

When working with HMS-BOT:
- Understand the conversation flow and chain architecture
- Consider retrieval quality when modifying indexing
- Be aware of model context limitations
- Test thoroughly with diverse queries
- Document changes to conversation patterns
- Consider production deployment implications