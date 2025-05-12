# SYSTEM_COMPONENTS/data: Cross-component Data Repository

This AGENTS.md file provides specific guidance for working with the data directory, which serves as a central repository for cross-component data and analysis.

## 1. COMPONENT OVERVIEW

The data directory serves as:
- A centralized location for cross-component data storage
- A repository for analysis results
- A storage location for environment configurations
- A tracking system for issues and work tickets
- A source of root cause information

## 2. DIRECTORY STRUCTURE

- **analysis/**: Contains analysis results from various components
- **environments/**: Environment configuration data
- **issues/**: Tracking information for known issues
- **status/**: Current status information for components
- **summaries/**: Summary reports from various processes
- **test-results/**: Results from test runs
- **work-tickets/**: Work ticket information
- **root_cause.json**: Root cause analysis data

## 3. DATA FORMATS

- JSON is the preferred format for structured data
- Text files should use UTF-8 encoding
- Timestamps should follow ISO 8601 format
- File naming should follow component-specific conventions

## 4. USAGE GUIDELINES

### Reading Data
- Component data should be read through appropriate APIs where available
- Direct file access should be limited to utility scripts
- Be aware of locking mechanisms when reading data that might be actively written

### Writing Data
- Always create backups before modifying critical data
- Follow the established schema for each data type
- Update timestamps and version information appropriately
- Use atomic write patterns when possible to prevent corruption

### Cross-Component Data Sharing
- Document any schema changes that affect other components
- Coordinate with component owners when making significant changes
- Use the established notification mechanisms when updating shared data

## 5. ROOT CAUSE ANALYSIS

The `root_cause.json` file contains critical information about system issues:
- Problem identification
- Contributing factors
- Resolution steps
- Prevention measures

When updating this file:
- Maintain the existing schema
- Include detailed information about new issues
- Link to relevant work tickets
- Update status information appropriately

## 6. INTEGRATION WITH OTHER COMPONENTS

- **HMS-CDF**: Consumes analysis data for policy decisions
- **HMS-NFO**: Indexes data for search functionality
- **HMS-A2A**: Agents may access data for decision-making
- **HMS-SYS**: Core infrastructure monitors data integrity

## 7. AI ASSISTANT GUIDELINES

When working with the data directory:
- Maintain data integrity as the highest priority
- Follow established schemas and data formats
- Be aware of cross-component dependencies
- Document any changes to data structures
- Consider the impact of data modifications on all consuming components