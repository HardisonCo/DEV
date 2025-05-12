# HMS-ETL: Data Pipeline and Transformation

This AGENTS.md file provides specific guidance for working with the HMS-ETL component, which handles data extraction, transformation, and loading.

## 1. COMPONENT OVERVIEW

HMS-ETL (Data Pipeline and Transformation) is responsible for:
- Managing data extraction from various sources
- Implementing data transformation processes
- Loading data into target systems
- Ensuring data quality and validation
- Supporting real-time and batch processing

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **PyTest**: Testing framework
- **Azure Pipelines**: CI/CD integration
- **Pandas/NumPy**: Data processing

### Key Dependencies
- See `pyproject.toml` for complete Python dependencies
- Database connectors for various sources and targets
- Validation libraries

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **extractors/**: Data source connectors
  - **transformers/**: Data transformation logic
  - **loaders/**: Target system connectors
  - **validators/**: Data validation rules
  - **utils/**: Utility functions
- **tests/**: Test suites
- **config/**: Configuration files
- **docs/**: Documentation

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Use type annotations consistently
- Follow PEP 8 style guidelines
- Document functions with docstrings
- Implement proper error handling
- Write tests for all data transformations

### Data Pipeline Design
- Design for idempotency
- Implement proper error recovery
- Add logging at appropriate levels
- Support both batch and streaming where appropriate
- Document data schemas thoroughly

### Integration Patterns
- Use standardized connectors for common systems
- Implement retry logic for external dependencies
- Document transformation rules
- Support data lineage tracking

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Install dependencies
pip install -e ".[dev]"

# Run tests
pytest

# Run a specific pipeline
python -m src.pipelines.run --config=config/pipeline.yml
```

### Data Validation
```bash
# Validate data quality
python -m src.validators.validate --source=data.csv

# Generate data quality report
python -m src.reporting.quality --source=data.csv --output=report.html
```

## 6. TROUBLESHOOTING

### Common Issues
- **Data Format Mismatches**: Verify source data schemas
- **Pipeline Failures**: Check logs for specific transformation errors
- **Performance Issues**: Monitor memory usage during large transformations
- **Connection Problems**: Verify credentials and network connectivity

### Debugging
- Review detailed logs
- Use Python debugger for complex issues
- Check intermediate data states
- Validate against expected schemas

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Migration to modern Python packaging
- Enhanced validation framework
- Improved error handling
- Azure Pipelines integration

### Current Focus Areas
- Real-time streaming capabilities
- Enhanced data quality metrics
- Cross-system data synchronization
- Schema evolution support

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: Consuming transformed data
- **HMS-CDF**: Policy-driven data transformations
- **HMS-EMR**: Medical data extraction and loading
- **HMS-NFO**: Preparing data for indexing

## 9. AI ASSISTANT GUIDELINES

When working with HMS-ETL:
- Understand data schemas before modifying transformations
- Consider performance implications for large datasets
- Implement thorough validation for data integrity
- Document data lineage and transformation logic
- Test with representative data samples
- Be aware of privacy concerns for sensitive data