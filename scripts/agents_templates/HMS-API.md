# HMS-API: Backend API Services

This AGENTS.md file provides specific guidance for working with the HMS-API component, which implements the backend API services using PHP/Laravel.

## 1. COMPONENT OVERVIEW

HMS-API is responsible for:
- Providing RESTful API endpoints for all system components
- Managing database operations and data persistence
- Implementing authentication and authorization
- Supporting tenant-based multi-organization architecture
- Processing and validating user inputs

## 2. TECHNOLOGY STACK

### Primary Languages and Frameworks
- **PHP**: Main implementation language
- **Laravel**: Web application framework
- **Composer**: Dependency management
- **MySQL/PostgreSQL**: Database
- **Laravel Echo**: Real-time events
- **Vue.js**: Frontend components (within Laravel)

### Key Dependencies
- See `composer.json` for complete PHP dependencies
- Laravel modules and packages
- Frontend dependencies in `package.json`

## 3. DIRECTORY STRUCTURE

- **app/**: Main application code
  - **app/Http/Controllers/**: API controllers
  - **app/Models/**: Database models
  - **app/Services/**: Business logic services
  - **app/Console/**: Console commands
- **config/**: Configuration files
- **database/**: Migrations and seeders
- **Modules/**: Modular components
- **resources/**: Frontend resources
- **routes/**: API and web routes
- **tests/**: Test suites
- **public/**: Publicly accessible files

## 4. DEVELOPMENT GUIDELINES

### Laravel Best Practices
- Follow Laravel naming conventions
- Use dependency injection
- Implement repository pattern for database operations
- Use Laravel's validation system
- Implement proper error handling
- Write tests using PHPUnit

### Integration Points
- API endpoints consumed by frontend components
- Event broadcasting for real-time updates
- Database transactions for data integrity
- Authentication via Laravel Sanctum/Passport

### Database Management
- Use migrations for schema changes
- Implement seeders for test data
- Follow naming conventions for tables and columns
- Use Eloquent relationships appropriately

## 5. COMMON OPERATIONS

### Running the System
```bash
# Start the development server
php artisan serve

# Run database migrations
php artisan migrate

# Clear cache
php artisan cache:clear

# Run tests
php artisan test
```

### Code Generation
```bash
# Generate a new controller
php artisan make:controller NameController

# Generate a new model with migration
php artisan make:model Name -m

# Generate a new module
php artisan module:make ModuleName
```

## 6. TROUBLESHOOTING

### Common Issues
- **Database Connection**: Check .env configuration
- **Missing Dependencies**: Run composer install
- **Cache Issues**: Clear cache with artisan commands
- **Permission Problems**: Check storage and bootstrap/cache permissions

### Debugging
- Check Laravel logs in storage/logs
- Use Laravel Telescope for request debugging
- Enable SQL query logging during development
- Use Laravel Tinker for interactive debugging

## 7. RECENT CHANGES AND ROADMAP

### Recent Significant Changes
- Implementation of multi-tenant architecture
- Module-based organization
- Enhanced authentication system
- Real-time event broadcasting

### Current Focus Areas
- API performance optimization
- Enhanced security features
- FHIR integration
- Cross-module communication

## 8. INTEGRATION WITH OTHER COMPONENTS

- **HMS-MFE**: Provides API for frontend components
- **HMS-CDF**: Exchanges policy data
- **HMS-A2A**: Supplies agent API endpoints
- **HMS-SYS**: Core infrastructure integration

## 9. AI ASSISTANT GUIDELINES

When working with HMS-API:
- Follow Laravel conventions consistently
- Be cautious with database schema changes
- Test API endpoints thoroughly
- Consider security implications of changes
- Document API changes for frontend developers
- Be aware of the multi-tenant architecture