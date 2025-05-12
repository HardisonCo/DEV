# AGENTS.md Guide: Comprehensive Documentation for AI Assistants

This guide explains the purpose, structure, and maintenance of AGENTS.md files throughout the repository. These files provide essential guidance for both human developers and AI assistants working with this multi-language codebase.

## 1. Purpose

AGENTS.md files serve several critical purposes:

1. **Unified Guidance**: Provide consistent guidelines across different programming languages and components
2. **Context for AI**: Offer essential context to AI assistants about code patterns, conventions, and restrictions
3. **Developer Onboarding**: Help new developers understand component architecture and best practices
4. **Cross-component Integration**: Document integration points between different parts of the system
5. **Historical Context**: Capture architectural decisions and their rationale

## 2. File Hierarchy

AGENTS.md files are organized in a hierarchical structure:

1. **Personal Level** (~/.codex/AGENTS.md)
   - Contains individual developer preferences
   - Specific workflow guidance for personal projects
   - Override points for repository-level defaults

2. **Repository Root** (~/Desktop/DEV/AGENTS.md)
   - High-level system architecture 
   - Multi-language guidelines
   - Cross-component integration patterns
   - Historical context for major architectural decisions

3. **Component Level** (~/Desktop/DEV/SYSTEM_COMPONENTS/*/AGENTS.md)
   - Component-specific guidance
   - Language-specific best practices
   - Integration points with other components
   - Troubleshooting common issues

## 3. Standard Structure

While there may be variations based on component needs, AGENTS.md files generally follow this structure:

1. **Component Overview**: What this component does and its role in the system
2. **Technology Stack**: Languages, frameworks, and key dependencies
3. **Directory Structure**: Organization of files and their purpose
4. **Development Guidelines**: Coding standards and best practices
5. **Common Operations**: Building, testing, and maintenance tasks
6. **Troubleshooting**: Common issues and their resolutions
7. **Integration Points**: How this component interacts with others
8. **AI Assistant Guidelines**: Specific guidance for AI assistants

## 4. Maintenance

The `scripts/update_agents_md.sh` utility helps maintain AGENTS.md files:

```bash
# Scan the repository for AGENTS.md files
./scripts/update_agents_md.sh scan

# Create missing AGENTS.md files
./scripts/update_agents_md.sh create

# Update a specific component's AGENTS.md
./scripts/update_agents_md.sh update HMS-NFO

# Extract templates from existing AGENTS.md files
./scripts/update_agents_md.sh extract
```

### When to Update

AGENTS.md files should be updated when:

1. Adding new components to the system
2. Making significant architectural changes
3. Changing coding standards or best practices
4. Adding new integration points between components
5. Discovering common issues that should be documented

## 5. Best Practices

### For Contributors

- Review relevant AGENTS.md files before making changes to a component
- Update AGENTS.md when making significant architectural changes
- Follow the established coding conventions for each language
- Document integration points clearly
- Include troubleshooting guidance for complex issues

### For Maintainers

- Keep AGENTS.md files concise and focused
- Update root-level guidance when making cross-component changes
- Review and update component-level files during release cycles
- Remove outdated guidance promptly
- Ensure consistent formatting across all files

## 6. AI Integration

AI assistants use AGENTS.md files to:

1. Understand repository structure and component relationships
2. Follow language-specific coding conventions
3. Integrate with the established architecture
4. Avoid common pitfalls specific to each component
5. Respect system-wide constraints and guidelines

The AI merges instructions from all applicable AGENTS.md files, with personal files taking precedence over component-specific ones, which in turn take precedence over repository-level guidance.

## 7. Future Directions

As the repository evolves, consider these enhancements to the AGENTS.md system:

1. Automated validation to ensure file accuracy
2. Integration with CI/CD pipelines
3. Version-specific guidance sections
4. Component relationship diagrams
5. Expanded troubleshooting guidance

## 8. Getting Help

If you have questions about AGENTS.md files:

- Review this guide for general principles
- Check component-specific documentation
- Consult with component maintainers
- Refer to the git history for context on file changes