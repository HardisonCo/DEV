# HMS-UTL: Utilities

This AGENTS.md file provides specific guidance for working with the HMS-UTL component, which provides utility functions and tools.

## 1. COMPONENT OVERVIEW

HMS-UTL (Utilities) is responsible for:
- Providing shared utility functions
- Implementing common tools
- Supporting data processing needs
- Facilitating common operations
- Offering reusable components across the system

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Python**: Main implementation language
- **Bash**: Shell scripts
- **Supervisord**: Process control
- **Various Python libraries**: For specific utilities

### Key Dependencies
- See `requirements.txt` for complete Python dependencies
- Standard library utilities
- Network and data processing libraries

## 3. DIRECTORY STRUCTURE

- **app.py**: Main application entry point
- **downloader.py**: Data download utilities
- **start_downloader.sh**: Script to initialize downloader
- **supervisorctl.conf**: Process control configuration
- **proxies.txt**: Proxy configuration
- **cookies.sqlite**: Cookie storage

## 4. DEVELOPMENT GUIDELINES

### Python Best Practices
- Keep utility functions focused and modular
- Implement proper error handling
- Document function parameters and return values
- Support both command line and library usage
- Consider performance for data-intensive operations

### Shell Script Standards
- Document script usage and parameters
- Implement proper error handling
- Use environment variables for configuration
- Add logging for operations
- Follow shell script best practices

### Reusability Considerations
- Design utilities to be usable across components
- Document dependencies clearly
- Implement consistent interfaces
- Support configuration via environment or files
- Consider backward compatibility

## 5. COMMON OPERATIONS

### Running Utilities
```bash
# Start the downloader service
./start_downloader.sh

# Run the main application
python app.py

# Download with specific configuration
python downloader.py --config=config.json
```

### Development Tasks
```bash
# Install dependencies
pip install -r requirements.txt

# Run tests
pytest

# Check code quality
flake8
```

## 6. TROUBLESHOOTING

### Common Issues
- **Network Connectivity**: Check proxy configuration
- **Permission Problems**: Verify file access rights
- **Dependency Conflicts**: Check requirements
- **Resource Limitations**: Monitor memory and disk usage

### Debugging
- Enable verbose logging
- Check process status with supervisorctl
- Verify configuration files
- Test individual utilities in isolation

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Enhanced download capabilities
- Improved error handling
- Added proxy support
- Process management via supervisord

### Current Focus Areas
- Performance optimization
- Enhanced logging and monitoring
- Additional utility functions
- Better error recovery

## 8. INTEGRATION WITH OTHER COMPONENTS

- **All HMS components**: Utility consumer
- **HMS-CDF**: Data processing utilities
- **HMS-NFO**: Download support for indexing
- **HMS-ETL**: Data transformation utilities

## 9. AI ASSISTANT GUIDELINES

When working with HMS-UTL:
- Keep utility functions focused and single-purpose
- Maintain backward compatibility for existing utilities
- Document utility functions thoroughly
- Test utilities with various inputs and edge cases
- Consider performance implications for data-intensive operations
- Follow established error handling patterns
- Implement proper logging for troubleshooting