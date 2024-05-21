## Project Structure

- **config:** Contains configuration classes for Spring Security and database configuration.
- **controller:** Contains the web layer controllers for handling HTTP requests.
- **model:** Contains the entity classes representing the database tables.
- **repository:** Contains the repository interfaces for data access.
- **service:** Contains the service classes for business logic.
- **security:** Contains custom user details and security configurations.

## Configurations

### DatabaseConfig

The `DatabaseConfig` class configures the application's data source, entity manager factory, and transaction manager. It ensures that the application connects to the PostgreSQL database correctly and sets up JPA with Hibernate.

- **DataSource:** Configures the PostgreSQL database connection.
- **LocalContainerEntityManagerFactoryBean:** Sets up the JPA entity manager factory with Hibernate.
- **JpaTransactionManager:** Configures the transaction manager for managing transactions.

### SecurityConfig

The `SecurityConfig` class sets up Spring Security for the application. It configures authentication, authorization, and password encoding.

- **UserDetailsService:** Custom user details service for loading user-specific data.
- **PasswordEncoder:** Configures the password encoder to use BCrypt.
- **SecurityFilterChain:** Sets up security rules for HTTP requests, including login, logout, and access restrictions.

## Controllers

### HomeController

The `HomeController` handles requests to the home page.

- **@GetMapping("/home"):** Maps GET requests for the "/home" URL to the `home` method, which returns the "home" view.

### LoginController

The `LoginController` handles user login and registration requests.

- **Dependencies:** Injects `UserRepository` and `PasswordEncoder` to manage user data and encode passwords.

- **@GetMapping("/login"):** Maps GET requests for the "/login" URL to the `login` method, which returns the "login" view.

- **@GetMapping("/register"):** Maps GET requests for the "/register" URL to the `register` method, which adds a new `User` object to the model and returns the "register" view.

- **@PostMapping("/register"):** Maps POST requests for the "/register" URL to the `registerUser` method, which encodes the user's password, saves the user to the repository, and redirects to the "login" page.

## Models

### User

The `User` entity represents a user in the system. It includes fields for the user's ID, username, password, and roles. It has a many-to-many relationship with the `Role` entity.

- **id:** Unique identifier for the user.
- **username:** Unique username for the user.
- **password:** Encrypted password for the user.
- **roles:** A collection of roles assigned to the user.

### Role

The `Role` entity represents a role that can be assigned to a user. It includes fields for the role's ID and name.

- **id:** Unique identifier for the role.
- **name:** Name of the role.

## Repositories

### UserRepository

The `UserRepository` interface extends `JpaRepository` and provides methods for performing CRUD operations on `User` entities. It includes a method for finding a user by their username.

- **findByUsername(String username):** Finds a user by their username.

## Security

### OnlineUserDetails

The `OnlineUserDetails` class implements `UserDetails` and provides user-specific data for Spring Security. It includes methods for getting the user's authorities, password, and username, as well as checking if the account is non-expired, non-locked, credentials non-expired, and enabled.

- **getAuthorities():** Returns the roles assigned to the user.
- **getPassword():** Returns the user's password.
- **getUsername():** Returns the user's username.
- **isAccountNonExpired():** Returns true if the account is non-expired.
- **isAccountNonLocked():** Returns true if the account is non-locked.
- **isCredentialsNonExpired():** Returns true if the credentials are non-expired.
- **isEnabled():** Returns true if the account is enabled.

### UserService

The `UserService` class implements `UserDetailsService` and provides methods for loading a user by their username. It uses the `UserRepository` to find the user and the `OnlineUserDetails` class to provide user-specific data for Spring Security.

- **loadUserByUsername(String username):** Loads a user by their username and returns user-specific data.

## Setup

### Prerequisites

- Java 21
- Maven
- PostgreSQL

## Functionalities

### User Registration

- Users can register with a unique username and password.
- Passwords are encoded before being saved to the database.
- After successful registration, users are redirected to the login page.

### User Login

- Users can log in with their registered username and password.
- Passwords are verified using BCrypt encoding.
- After successful login, users are redirected to the home page.

### Home Page

- Authenticated users can access the home page.
- Unauthenticated users are redirected to the login page.

### User Details Management

- User-specific details, such as roles, are managed and provided for Spring Security.

### Data Access

- User data is accessed and managed using JPA repositories.
- Custom queries are used to find users by their username.

### Security

- Authentication and authorization are managed using Spring Security.
- Different roles (e.g., USER) are used to manage access to different parts of the application.
- Security configurations are set up to protect against common security vulnerabilities.

### Testing

- Comprehensive tests are in place for all major functionalities, including user registration, login, data access, and security configurations.
- Tests ensure that users can be found by their username and that appropriate exceptions are thrown when users are not found.

### Future Enhancements

- Add More User Roles: Implement roles like ADMIN and USER with different access levels.
- Implement User Profile: Add functionality for users to update their profiles.
- Add Email Verification: Implement email verification for new user registrations.
- Improve Security: Enhance security features such as password reset, account lockout after multiple failed login attempts, and two-factor authentication.
- API Integration: Develop RESTful APIs for user management.
