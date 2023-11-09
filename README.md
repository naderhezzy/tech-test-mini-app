# MINTIT Technical Assignment

# Formula 1 Ranking App

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Features](#features)
- [UI Screens](#ui-screens)
- [State Management](#state-management)
- [Data Loading](#data-loading)
- [Validation](#validation)
- [Configuration and Styles](#configuration-and-styles)
- [Usage](#usage)

## Introduction

- In this test, I've provided two versions of the app. In the 'dev' branch, I've implemented a clean architecture without state management, focusing on the core architectural principles.

- In the 'master' branch, I've introduced state management using the Provider package and followed the MVVM (Model-View-ViewModel) design pattern for structured and efficient data flow.

- I've incorporated a service to mock data fetching and API calls, ensuring smooth functionality.

- Additionally, I've included utility methods for dynamic size calculations, enhancing the responsiveness of the app, along with a global style configuration file to maintain consistent visual elements throughout the application.

- I've also included a splash screen

- BONUS: As bonus features, I've implemented an app icon using Canva.com, which was not part of the exercise's requirements. I've also added (for testing purposes) a logout button to switch between screens easily when testing the APK on a real device.

## Getting Started

Run the app: `flutter run`

## Features

- **User Registration**: Users can create an account by providing their first name and last name.
- **Driver Rankings**: View the rankings of Formula 1 drivers, including their full names, teams, and positions.

## UI Screens

### Home Screen

- Displays the top 10 rankings for Formula 1 drivers.
- Allows users to log out and displays user information.

### Registration Screen

- Enables user registration by providing first and last names.
- Includes validation to ensure only valid names are accepted.

## State Management

- Utilizes the Provider package for state management.
- Includes `DriverViewmodel` and `UserViewmodel` for managing drivers and user information, respectively.

## Data Loading

- Loads driver data from a JSON file located in the assets folder.
- The data is loaded using the `DriverService` and displayed in the `HomeScreen`.

## Validation

- Validates user input for first and last names to accept only letters and spaces.
- Error messages are shown when validation fails.

## Configuration and Styles

- Configuration and styles are managed in the `AppStyles` and `AppConfig` files.
- Provides font sizes, font weights, spacings, colors, and other styling parameters.

## Usage

To use the Formula 1 Driver Ranking App:

1. Launch the app and navigate to the registration screen.
2. Provide your first and last name.
3. View the driver rankings on the home screen.
4. Log out when done.
