# HMS-LLM: Language Model Integration

This AGENTS.md file provides specific guidance for working with the HMS-LLM component, which handles language model integration and management.

## 1. COMPONENT OVERVIEW

HMS-LLM (Language Model Integration) is responsible for:
- Managing language model integrations
- Implementing model context handling
- Providing consistent interfaces to various models
- Ensuring responsible AI usage
- Supporting model evaluation and benchmarking

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **Rust**: Performance-critical components
- **Various LLM APIs**: OpenAI, Anthropic, etc.
- **Evaluation frameworks**: For model benchmarking

### Key Dependencies
- See repository for complete dependencies
- LLM API clients
- Evaluation libraries

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **models/**: Model integrations
  - **evaluation/**: Benchmarking tools
  - **interfaces/**: Common interfaces
  - **utils/**: Utility functions
- **tests/**: Test suites
- **examples/**: Example implementations
- **docs/**: Documentation

## 4. DEVELOPMENT GUIDELINES

### Best Practices
- Create consistent interfaces across models
- Implement proper error handling for API failures
- Document model-specific behaviors
- Provide clear versioning for model interfaces
- Implement responsible AI safeguards

### Model Integration
- Standardize input/output formats
- Handle rate limiting and retries
- Implement proper token counting
- Document model limitations

### Evaluation Framework
- Use consistent metrics across models
- Implement reproducible benchmarks
- Document evaluation methodologies
- Track performance over time

## 5. COMMON OPERATIONS

### Model Usage
```python
from hms_llm import get_model

# Get a model instance with default parameters
model = get_model("claude-3")

# Generate a response
response = model.generate("What is the capital of France?")
```

### Evaluation
```bash
# Run benchmarks
python -m hms_llm.evaluation.benchmark --model=claude-3

# Compare models
python -m hms_llm.evaluation.compare --models=claude-3,gpt-4
```

## 6. TROUBLESHOOTING

### Common Issues
- **API Authentication**: Check API keys and credentials
- **Rate Limiting**: Implement appropriate backoff strategies
- **Model Version Mismatches**: Verify model versions
- **Context Length Errors**: Check input token counts

### Debugging
- Enable verbose logging for API calls
- Test individual model components
- Verify input/output formats
- Check for API status issues

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Added support for Claude 3 models
- Enhanced evaluation framework
- Improved error handling
- Standardized interfaces

### Current Focus Areas
- Model context optimization
- Enhanced responsible AI features
- Multi-model routing
- Improved performance tracking

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-MCP**: Model context protocol
- **HMS-A2A**: Agent language model access
- **HMS-BOT**: Conversational AI integration
- **HMS-RAG**: Retrieval-augmented generation

## 9. AI ASSISTANT GUIDELINES

When working with HMS-LLM:
- Understand the differences between integrated models
- Be aware of model version requirements
- Consider token usage and context limits
- Implement proper error handling for model API failures
- Document model-specific behaviors
- Test across multiple model providers when changing interfaces