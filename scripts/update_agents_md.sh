#!/bin/bash
# update_agents_md.sh
#
# This script helps maintain AGENTS.md files across the repository.
# It can check for missing files, validate existing ones, and create new ones from templates.

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Templates directory - create if it doesn't exist
TEMPLATES_DIR="${SCRIPT_DIR}/agents_templates"
mkdir -p "${TEMPLATES_DIR}"

# Function to check if an AGENTS.md file exists in a directory
check_agents_md() {
    local dir="$1"
    if [[ -f "${dir}/AGENTS.md" ]]; then
        echo -e "${GREEN}✓${NC} AGENTS.md exists in ${dir}"
        return 0
    else
        echo -e "${YELLOW}⚠${NC} AGENTS.md missing in ${dir}"
        return 1
    fi
}

# Function to create a basic AGENTS.md template for a component
create_template() {
    local component="$1"
    local template_file="${TEMPLATES_DIR}/${component}.md"
    
    if [[ ! -f "${template_file}" ]]; then
        echo -e "${YELLOW}Creating template for ${component}...${NC}"
        cat > "${template_file}" << EOL
# ${component}: Component Description

This AGENTS.md file provides specific guidance for working with the ${component} component.

## 1. COMPONENT OVERVIEW

${component} is responsible for:
- Primary functionality 1
- Primary functionality 2
- Primary functionality 3

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Language**: Main implementation language
- **Framework**: Primary framework used

### Key Dependencies
- See dependency file for complete list

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
- **test/**: Test suites
- **docs/**: Documentation

## 4. DEVELOPMENT GUIDELINES

### Best Practices
- Coding standard 1
- Coding standard 2
- Coding standard 3

### Integration Points
- How this component integrates with others

## 5. COMMON OPERATIONS

### Building
\`\`\`bash
# Build command
\`\`\`

### Testing
\`\`\`bash
# Test command
\`\`\`

## 6. TROUBLESHOOTING

### Common Issues
- Issue 1: Resolution
- Issue 2: Resolution

## 7. INTEGRATION WITH OTHER COMPONENTS

- **Component 1**: Integration details
- **Component 2**: Integration details

## 8. AI ASSISTANT GUIDELINES

When working with ${component}:
- Guideline 1
- Guideline 2
- Guideline 3
EOL
        echo -e "${GREEN}Template created at ${template_file}${NC}"
    else
        echo -e "${GREEN}Template already exists for ${component}${NC}"
    fi
}

# Function to apply a template to a directory
apply_template() {
    local dir="$1"
    local component="$(basename "${dir}")"
    local template_file="${TEMPLATES_DIR}/${component}.md"
    
    if [[ ! -f "${template_file}" ]]; then
        echo -e "${YELLOW}No template found for ${component}, creating generic one...${NC}"
        create_template "${component}"
    fi
    
    echo -e "${GREEN}Applying template to ${dir}/AGENTS.md...${NC}"
    cp "${template_file}" "${dir}/AGENTS.md"
    echo -e "${GREEN}✓${NC} AGENTS.md created in ${dir}"
}

# Function to scan all components and check for AGENTS.md files
scan_components() {
    echo "Scanning repository for AGENTS.md files..."

    # Check root AGENTS.md
    check_agents_md "${REPO_ROOT}"

    # Check components
    for dir in "${REPO_ROOT}/SYSTEM_COMPONENTS"/*; do
        if [[ -d "${dir}" ]]; then
            check_agents_md "${dir}"
            # Break after first missing file to avoid overwhelming output
            if [[ $? -ne 0 && -n "$1" && "$1" == "break-on-first" ]]; then
                break
            fi
        fi
    done

    # Check codex directories
    check_agents_md "${REPO_ROOT}/codex-rs"
    check_agents_md "${REPO_ROOT}/codex-cli"

    echo "Scan complete."
}

# Function to create missing AGENTS.md files
create_missing() {
    echo "Creating missing AGENTS.md files..."
    
    # Check root AGENTS.md
    if ! check_agents_md "${REPO_ROOT}"; then
        echo -e "${YELLOW}Creating root AGENTS.md...${NC}"
        apply_template "${REPO_ROOT}"
    fi
    
    # Check components
    for dir in "${REPO_ROOT}/SYSTEM_COMPONENTS"/*; do
        if [[ -d "${dir}" ]] && ! check_agents_md "${dir}"; then
            local component="$(basename "${dir}")"
            echo -e "${YELLOW}Creating AGENTS.md for ${component}...${NC}"
            apply_template "${dir}"
        fi
    done
    
    # Check codex directories
    if ! check_agents_md "${REPO_ROOT}/codex-rs"; then
        echo -e "${YELLOW}Creating AGENTS.md for codex-rs...${NC}"
        apply_template "${REPO_ROOT}/codex-rs"
    fi
    
    if ! check_agents_md "${REPO_ROOT}/codex-cli"; then
        echo -e "${YELLOW}Creating AGENTS.md for codex-cli...${NC}"
        apply_template "${REPO_ROOT}/codex-cli"
    fi
    
    echo "Creation complete."
}

# Function to update a specific component's AGENTS.md
update_component() {
    local component="$1"
    local dir
    
    if [[ "${component}" == "root" ]]; then
        dir="${REPO_ROOT}"
    elif [[ "${component}" == "codex-rs" ]]; then
        dir="${REPO_ROOT}/codex-rs"
    elif [[ "${component}" == "codex-cli" ]]; then
        dir="${REPO_ROOT}/codex-cli"
    else
        dir="${REPO_ROOT}/SYSTEM_COMPONENTS/${component}"
    fi
    
    if [[ ! -d "${dir}" ]]; then
        echo -e "${RED}Error: Component directory ${dir} not found${NC}"
        return 1
    fi
    
    echo "Updating AGENTS.md for ${component}..."
    apply_template "${dir}"
}

# Function to extract templates from existing AGENTS.md files
extract_templates() {
    echo "Extracting templates from existing AGENTS.md files..."
    
    # Extract from root AGENTS.md
    if [[ -f "${REPO_ROOT}/AGENTS.md" ]]; then
        echo -e "${GREEN}Extracting template from root AGENTS.md...${NC}"
        cp "${REPO_ROOT}/AGENTS.md" "${TEMPLATES_DIR}/root.md"
    fi
    
    # Extract from components
    for dir in "${REPO_ROOT}/SYSTEM_COMPONENTS"/*; do
        if [[ -d "${dir}" && -f "${dir}/AGENTS.md" ]]; then
            local component="$(basename "${dir}")"
            echo -e "${GREEN}Extracting template from ${component}...${NC}"
            cp "${dir}/AGENTS.md" "${TEMPLATES_DIR}/${component}.md"
        fi
    done
    
    # Extract from codex directories
    if [[ -f "${REPO_ROOT}/codex-rs/AGENTS.md" ]]; then
        echo -e "${GREEN}Extracting template from codex-rs...${NC}"
        cp "${REPO_ROOT}/codex-rs/AGENTS.md" "${TEMPLATES_DIR}/codex-rs.md"
    fi
    
    if [[ -f "${REPO_ROOT}/codex-cli/AGENTS.md" ]]; then
        echo -e "${GREEN}Extracting template from codex-cli...${NC}"
        cp "${REPO_ROOT}/codex-cli/AGENTS.md" "${TEMPLATES_DIR}/codex-cli.md"
    fi
    
    echo "Extraction complete. Templates are in ${TEMPLATES_DIR}"
}

# Display help information
show_help() {
    echo "Usage: $(basename "$0") [OPTION] [COMPONENT]"
    echo "Maintain AGENTS.md files across the repository."
    echo
    echo "Options:"
    echo "  scan          Scan the repository for AGENTS.md files"
    echo "  create        Create missing AGENTS.md files using templates"
    echo "  update COMP   Update AGENTS.md for a specific component"
    echo "  extract       Extract templates from existing AGENTS.md files"
    echo "  help          Display this help and exit"
    echo
    echo "Examples:"
    echo "  $(basename "$0") scan"
    echo "  $(basename "$0") create"
    echo "  $(basename "$0") update HMS-NFO"
    echo "  $(basename "$0") update root"
    echo "  $(basename "$0") extract"
}

# Main script logic
if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    scan)
        scan_components
        ;;
    create)
        create_missing
        ;;
    update)
        if [[ $# -ne 2 ]]; then
            echo -e "${RED}Error: Component name required for update${NC}"
            show_help
            exit 1
        fi
        update_component "$2"
        ;;
    extract)
        extract_templates
        ;;
    help)
        show_help
        ;;
    *)
        echo -e "${RED}Error: Unknown option: $1${NC}"
        show_help
        exit 1
        ;;
esac

exit 0