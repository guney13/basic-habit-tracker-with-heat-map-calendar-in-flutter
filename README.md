# Habit Tracker

A flutter application for habit tracking with a clean UI, dark mode support, and visual progress tracking through heatmaps.

## Features

- **Offline Database**: Cross-platform offline storage using ISAR for habits and completion history
- **Navigation**: Navigator for routing to settings page
- **State Management**: Provider pattern for managing habit database, theme preferences, and customizable widget layout
- **Visual Progress**: Heatmap to visualize habit completion over time
- **Dark Mode**: Toggle between light and dark themes
- **Customizable Layout**: Customizable widget placement for personalized user experience


## Tech Stack

- **Framework**: Flutter
- **Database**: ISAR
- **State Management**: Provider


## Project Structure

```
lib/
├── components/      # Reusable UI components
├── database/        # Database configuration and operations
├── models/          # Data models and schemas
├── pages/           # Application screens
├── theme/           # Theme configuration and styling
└── utils/           # Utility functions and helpers
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Usage of the App

- **Add Habits**: Tap the add button to create new habits to track
- **Complete Habits**: Check off habits as you complete them daily
- **Edit/Delete Habit**: Slide any habit to left to edit its name or delete it
- **View Progress**: Monitor your consistency through the heatmap visualization
- **Customize**: Adjust theme and layout preferences in settings page