# HMS-MFE: Micro-Frontend Framework

This AGENTS.md file provides specific guidance for working with the HMS-MFE component, which implements the micro-frontend framework.

## 1. COMPONENT OVERVIEW

HMS-MFE (Micro-Frontend Framework) is responsible for:
- Providing a component library for frontend development
- Implementing a micro-frontend architecture
- Enabling consistent UI/UX across applications
- Supporting modular frontend development
- Facilitating UI component reuse

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **TypeScript**: Type-safe JavaScript
- **Vue.js**: Frontend framework
- **Vite**: Build tool
- **Bulma**: CSS framework with customization
- **CSS Variables**: For theming

### Key Dependencies
- See `package.json` for complete frontend dependencies
- Vite plugins and extensions
- TypeScript type definitions
- Testing libraries

## 3. DIRECTORY STRUCTURE

- **src/**: Main source code
  - **components/**: Reusable UI components
  - **composables/**: Vue composables
  - **styles/**: Global styles and theme variables
  - **utils/**: Utility functions
- **tests/**: Test suites
- **docs/**: Documentation
- **examples/**: Example implementations
- **scripts/**: Build and utility scripts

## 4. DEVELOPMENT GUIDELINES

### Vue Best Practices
- Use composition API for components
- Create self-contained components
- Document props, events, and slots
- Use TypeScript for type safety
- Follow the established component structure

### Styling Standards
- Use Bulma CSS variables for theming
- Follow BEM naming conventions
- Create responsive designs by default
- Support dark/light modes where appropriate
- Consider accessibility in all components

### Testing Requirements
- Write unit tests for components
- Include accessibility tests
- Test responsive behavior
- Document test coverage

## 5. COMMON OPERATIONS

### Development Workflow
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build library
npm run build

# Run tests
npm run test
```

### Component Development
```bash
# Create a new component
npm run create-component MyComponent

# Test a specific component
npm run test -- --filter=MyComponent

# Build documentation
npm run docs:build
```

## 6. TROUBLESHOOTING

### Common Issues
- **Build Errors**: Check TypeScript type issues
- **Style Conflicts**: Verify CSS scoping
- **Component Integration**: Check prop types and events
- **Responsive Issues**: Test across breakpoints

### Debugging
- Use Vue DevTools for component inspection
- Check browser console for errors
- Test components in isolation
- Verify style application in browser inspector

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Migration to Vite from webpack
- Enhanced TypeScript integration
- Improved component architecture
- CSS variables for theming

### Current Focus Areas
- Accessibility improvements
- Performance optimization
- Enhanced component documentation
- Expanded test coverage

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: Backend data integration
- **HMS-GOV**: Administrative interface components
- **HMS-MKT**: Marketplace UI components
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-MFE:
- Follow the established component patterns
- Maintain TypeScript type safety
- Consider accessibility requirements
- Test components across different viewport sizes
- Document component APIs thoroughly
- Follow the CSS naming conventions
- Consider performance implications for UI components