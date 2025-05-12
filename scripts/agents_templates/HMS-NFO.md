# HMS-NFO: Information Processing and Indexing

This AGENTS.md file provides specific guidance for working with the HMS-NFO component, which handles information processing and indexing using Clojure.

## 1. COMPONENT OVERVIEW

HMS-NFO (Information Processing and Indexing) is responsible for:
- Creating and maintaining search indices
- Processing structured and unstructured information
- Integrating with genetic analysis components
- Supporting cross-domain data integration
- Providing search functionality across the system

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Clojure**: Main implementation language
- **Python**: Supporting scripts and utilities
- **Leiningen**: Project build and dependency management
- **Ring/Compojure**: Web server components (when applicable)

### Key Dependencies
- See `project.clj` for complete Clojure dependencies
- Python utilities may have their own requirements (see individual script headers)

## 3. DIRECTORY STRUCTURE

- **src/**: Main Clojure source code
  - **src/util/**: Utility functions
  - **src/etl/**: Data processing pipelines
- **resources/**: Static resources and configuration
- **test/**: Test suites
- **docs/**: Documentation
- **www.*.gov/**: Processed data from specific government websites
- **logs/**: Log files
- **processed_data/**: Output from data processing operations
- **scripts and .sh files**: Various utility scripts for running and managing the system

## 4. DEVELOPMENT GUIDELINES

### Clojure Best Practices
- Follow functional programming paradigms
- Use immutable data structures
- Document functions with docstrings
- Use namespaces to organize code logically
- Write tests for core functionality

### Integration Points
- Search indices are consumed by other HMS components
- Genetic analysis integration coordinates with HMS-CDF
- Data pipelines may pull from or push to external systems

### Search Index Management
- Indexing operations are resource-intensive; schedule appropriately
- Use incremental indexing when possible
- The `reindex_all.sh` and `reindex_www.sh` scripts manage full and partial reindexing
- Monitor the size of search indices to avoid performance issues

## 5. COMMON OPERATIONS

### Running the Search Service
```bash
./run_with_minimal_deps.sh
```

### Rebuilding Indices
```bash
./reindex_all.sh    # Complete reindexing
./reindex_www.sh    # Reindex specific sites
```

### Validating Clojure Migration
```bash
./validate_clojure_migration.sh
```

### Testing Genetic Integration
```bash
./test_genetic_integration.sh
```

## 6. TROUBLESHOOTING

### Common Issues
- **JVM Memory Issues**: Adjust memory settings in scripts
- **Dependency Conflicts**: Use `fix_dependencies.sh` to resolve
- **Failed Indexing**: Check logs for errors, verify source data integrity
- **Performance Problems**: Review index sizes and query patterns

### Logging
- Check the `logs/` directory for detailed error information
- Most scripts write to both stdout and log files
- Important errors may be captured in `search_index_summary.json`

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Integration with genetic analysis components
- Enhanced search indexing performance
- Migration of certain components from legacy systems
- Implementation of combined search indices

### Current Focus Areas
- GA search index integration
- Master plan implementation
- Performance optimization
- Cross-agency data sharing

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-CDF**: Provides policy data for indexing
- **HMS-API**: Consumes search indices via API
- **HMS-A2A**: Agents may query indices for information
- **HMS-MFE**: Frontend interfaces display search results

## 9. AI ASSISTANT GUIDELINES

When working with HMS-NFO:
- Understand the functional programming patterns used in Clojure
- Be aware of the resource-intensive nature of indexing operations
- Consider data integrity and validity when processing information
- Follow the established naming conventions and code organization
- Test thoroughly, especially when modifying search indexing logic