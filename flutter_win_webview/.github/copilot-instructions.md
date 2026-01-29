# Copilot Instructions for Flutter Win Webview

## Project Overview
This project is a Flutter application designed to run on Windows, utilizing web views for rendering web content. The architecture is modular, with distinct components for authentication, data handling, and UI rendering.

## Key Components
- **lib/**: Contains the main application code, including UI components and business logic.
- **auths/**: Manages authentication flows, including Keycloak integration.
- **configs/**: Holds configuration files for API URLs and other settings.
- **windows/**: Contains platform-specific code and CMake configurations for building the Windows application.

## Developer Workflows
### Building the Project
To build the project, use the following command in the terminal:
```bash
flutter build windows
```
This command compiles the application for Windows, generating the necessary binaries.

### Running Tests
To run tests, execute:
```bash
flutter test
```
This will run all unit tests defined in the `test/` directory.

### Debugging
For debugging, use:
```bash
flutter run --debug
```
This command allows you to run the application in debug mode, enabling breakpoints and inspection.

## Project Conventions
- **Naming Conventions**: Use camelCase for variable names and PascalCase for class names.
- **File Structure**: Organize files by feature rather than type, promoting modularity and ease of navigation.

## Integration Points
- **Keycloak**: The application integrates with Keycloak for authentication. Refer to `lib/auths/providers/keycloak_provider.dart` for implementation details.
- **CMake**: The project uses CMake for building the Windows application. Key configurations can be found in `windows/CMakeLists.txt`.

## External Dependencies
- **Flutter SDK**: Ensure you have the Flutter SDK installed and configured.
- **CMake**: Required for building the Windows application. Make sure to have a compatible version installed.

## Communication Patterns
Components communicate through well-defined interfaces, particularly in the `auths` and `configs` directories, ensuring separation of concerns and maintainability.

---

This document serves as a guide for AI coding agents to understand the structure and workflows of the Flutter Win Webview project. For further details, refer to the specific files mentioned above.