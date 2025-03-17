# Baridx Task

A Flutter application for managing delivery orders with a modern, clean architecture approach. This application provides a seamless experience for managing delivery orders with features like multi-step order creation, secure payment processing, and theme customization.

## 📱 Overview

Baridx Task is built with Flutter, following clean architecture principles to ensure maintainability, scalability, and testability. The application leverages modern state management solutions and follows material design guidelines for a consistent user experience.

## 🌟 Features

### Modern UI with Material Design
- Clean and intuitive user interface following Material Design 3 guidelines
- Responsive layout that adapts to different screen sizes
- Custom widgets and animations for enhanced user experience
- Poppins font family integration for modern typography

### Secure Local Storage
- Encrypted storage for sensitive data using flutter_secure_storage
- Local preferences management with shared_preferences
- Secure handling of user credentials and payment information
- Unique identifier generation using UUID

### Multi-step Order Creation
- Intuitive step-by-step order creation process
- Form validation at each step
- Progress tracking and step navigation
- Data persistence between steps

### Credit Card Payment Integration
- Secure credit card input using flutter_credit_card
- Card validation and formatting
- Support for multiple card types
- Secure payment information handling

### Responsive Design
- Screen size adaptation using flutter_screenutil
- Consistent layout across different devices
- Adaptive UI components
- Orientation support

## 🛠 Tech Stack

### Framework
- Flutter SDK: ^3.5.4 - Latest stable version with enhanced performance and features

### UI Components
- `cupertino_icons`: ^1.0.8 - iOS-style icons
- `flutter_svg`: ^2.0.15 - SVG rendering support
- `flutter_screenutil`: ^5.9.3 - Responsive UI scaling
- `flutter_animate`: ^4.5.2 - Advanced animations
- `form_field_validator`: ^1.1.0 - Form input validation
- `country_picker`: ^2.0.27 - Country selection widget
- `flutter_credit_card`: ^4.1.0 - Credit card input and validation

### State Management
- `flutter_bloc`: ^8.1.6 - Predictable state management
- `bloc`: ^8.1.4 - Business logic components

### Navigation
- `go_router`: ^14.8.1 - Declarative routing solution

### Dependency Injection
- `get_it`: ^8.0.2 - Service locator for dependency injection
- `injectable`: ^2.5.0 - Code generation for dependency injection

### Local Storage
- `shared_preferences`: ^2.3.4 - Key-value storage
- `flutter_secure_storage`: ^9.2.2 - Encrypted storage
- `uuid`: ^4.5.1 - Unique identifier generation

### Code Generation
- `freezed_annotation`: ^2.4.4 - Immutable class generation
- `json_annotation`: ^4.9.0 - JSON serialization

## 📂 Project Structure

The project follows a feature-first architecture with clear separation of concerns:

```
lib/
├── core/                 # Core functionality and shared components
│   ├── app/              # App-level configurations
│   ├── common_widgets/   # Reusable widgets
│   ├── extensions/       # Extension methods
│   ├── helpers/          # Helper functions
│   ├── router/           # Navigation setup
│   └── services/         # Core services
├── features/             # Feature modules
│   ├── my_app/           # App initialization
│   └── order_creation/   # Order creation flow
└── main.dart            # Entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: ^3.5.4
- Dart SDK: ^3.0.0
- Android Studio / VS Code with Flutter extensions

### Installation
1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```bash
   flutter run
   ```
