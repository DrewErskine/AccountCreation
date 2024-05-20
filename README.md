# Online Portal

## Overview

The Online Portal is a Spring Boot application designed for managing user accounts with features including user registration, login, and basic user management.

## Project Structure

- **config:** Contains configuration classes for Spring Security and database configuration.
- **controller:** Contains the web layer controllers for handling HTTP requests.
- **model:** Contains the entity classes representing the database tables.
- **repository:** Contains the repository interfaces for data access.
- **service:** Contains the service classes for business logic.
- **security:** Contains custom user details and security configurations.

## Setup

### Prerequisites

- Java 21
- Maven
- PostgreSQL
- H2 (for testing)

### Future Enhancements
- Add More User Roles: Implement roles like ADMIN and USER with different access levels.
- Implement User Profile: Add functionality for users to update their profiles.
- Add Email Verification: Implement email verification for new user registrations.
- Improve Security: Enhance security features such as password reset, account lockout after multiple failed login attempts, and two-factor authentication.
- API Integration: Develop RESTful APIs for user management.

online
├───.mvn
│   └───wrapper
│           maven-wrapper.jar
│           maven-wrapper.properties
├───src
│   ├───main
│   │   ├───java
│   │   │   └───com
│   │   │       └───portal
│   │   │           └───online
│   │   │               │   OnlineApplication.java
│   │   │               ├───config
│   │   │               │       DatabaseConfig.java
│   │   │               │       SecurityConfig.java
│   │   │               ├───controller
│   │   │               │       HomeController.java
│   │   │               │       LoginController.java
│   │   │               ├───model
│   │   │               │       User.java
│   │   │               ├───repository
│   │   │               │       UserRepository.java
│   │   │               ├───service
│   │   │               │       UserService.java
│   │   │               └───security
│   │   │                       OnlineUserDetails.java
│   │   └───resources
│   │       │   application.properties
│   │       ├───static
│   │       └───templates
│   │               home.html
│   │               login.html
│   │               register.html
│   │       └───schema.sql
│   │       └───data.sql
│   └───test
│       └───java
│           └───com
│               └───portal
│                   └───online
│                           OnlineApplicationTests.java
└───target
    ├───classes
    │   │   application.properties
    │   ├───com
    │   │   └───portal
    │   │       └───online
    │   │           │   OnlineApplication.class
    │   │           ├───config
    │   │           │       SecurityConfig.class
    │   │           ├───controller
    │   │           │       HomeController.class
    │   │           │       LoginController.class
    │   │           ├───model
    │   │           │       User.class
    │   │           ├───repository
    │   │           │       UserRepository.class
    │   │           ├───service
    │   │           │       UserService.class
    │   │           └───security
    │   │                   OnlineUserDetails.class
    └───test-classes
        └───com
            └───portal
                └───online
                        OnlineApplicationTests.class
