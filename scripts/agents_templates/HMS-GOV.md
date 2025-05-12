# HMS-GOV: Governance and Compliance

This AGENTS.md file provides specific guidance for working with the HMS-GOV component, which handles governance, administration, and compliance.

## 1. COMPONENT OVERVIEW

HMS-GOV (Governance and Compliance) is responsible for:
- Providing administrative portal functionality
- Implementing governance and compliance frameworks
- Managing user roles and permissions
- Supporting policy enforcement
- Facilitating administrative workflows

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **Vue.js**: Frontend framework
- **Nuxt.js**: Vue meta-framework
- **TypeScript**: Type-safe JavaScript
- **CSS/SCSS**: Styling

### Key Dependencies
- See `package.json` for complete frontend dependencies
- Nuxt modules for enhanced functionality
- TypeScript type definitions

## 3. DIRECTORY STRUCTURE

- **app.vue**: Main application entry point
- **components/**: Vue components
  - **contact/**: Contact-related components
  - **admin/**: Administration components
  - **shared/**: Shared/reusable components
- **composables/**: Vue composables for shared logic
- **assets/**: Static assets (images, fonts, etc.)
- **pages/**: Page components and routing
- **layouts/**: Page layouts
- **store/**: State management
- **utils/**: Utility functions
- **middleware/**: Nuxt middleware

## 4. DEVELOPMENT GUIDELINES

### Vue/Nuxt Best Practices
- Use composition API for components
- Follow Vue's single-file component pattern
- Maintain TypeScript type safety
- Implement responsive design principles
- Follow established component architecture

### State Management
- Use Pinia/Vuex consistently
- Document state mutations
- Implement proper error handling
- Consider performance for larger state objects

### UI/UX Guidelines
- Follow the established design system
- Maintain accessibility standards
- Use consistent component patterns
- Support localization where required

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

### Component Development
```bash
# Create a new component
mkdir -p components/feature
touch components/feature/NewComponent.vue

# Create a new page
touch pages/feature.vue
```

## 6. TROUBLESHOOTING

### Common Issues
- **Build Errors**: Check TypeScript type issues
- **Runtime Errors**: Check browser console
- **Styling Inconsistencies**: Verify CSS scope
- **State Management**: Debug Pinia/Vuex state

### Debugging
- Use Vue DevTools browser extension
- Check browser console for errors
- Verify network requests
- Test individual components in isolation

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Migration to Nuxt 3
- Enhanced TypeScript integration
- Improved component architecture
- Enhanced governance workflows

### Current Focus Areas
- Accessibility improvements
- Performance optimization
- Advanced governance features
- Cross-component integration

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-API**: Backend data service integration
- **HMS-MFE**: Shared frontend components
- **HMS-CDF**: Policy framework integration
- **HMS-SYS**: Core infrastructure support

## 9. AI ASSISTANT GUIDELINES

When working with HMS-GOV:
- Follow Vue component patterns consistently
- Maintain TypeScript type safety
- Be mindful of component reusability
- Consider accessibility requirements
- Test across different viewport sizes
- Document component props and events
- Follow the established state management patterns