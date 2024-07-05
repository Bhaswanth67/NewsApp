# News App

A mobile news application developed with Flutter and Dart, designed to deliver the latest news articles from various sources. The app allows users to browse news articles, view details, and interact with the content seamlessly.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Components](#components)
- [Screenshots](#screenshots)
- [Contribution](#contribution)

## Features

- **Browse News Articles:** View a list of news articles from various sources.
- **Article Details:** Read detailed articles by tapping on any news item.
- **Responsive Design:** Adaptable interface for different screen sizes.

## Technologies Used

- **Flutter:** A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart:** The programming language used with Flutter to implement the app's functionality.

## Getting Started

### Prerequisites

- Flutter SDK (v3.0.0 or later)
- Dart SDK (v2.18.0 or later)
- An IDE like Visual Studio Code or Android Studio with Flutter and Dart plugins installed

### Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/Bhaswanth67/news-app.git
    cd news-app
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Run the app:**

    ```sh
    flutter run
    ```

4. **Open the app on your emulator or physical device.**

## Usage

1. **Browse Articles:** The main screen displays a list of news articles. Scroll through the list to view different articles.
2. **View Article Details:** Tap on any article to view its detailed content.
3. **Navigation:** Use the navigation features to move between different parts of the app.

## Project Structure


### Components

- **`customListTile.dart`**: A custom widget for displaying individual news items in a list.

### Model

- **`article_model.dart`**: Defines the data structure for news articles.
- **`source_model.dart`**: Defines the data structure for news sources.

### Pages

- **`articles_details_page.dart`**: The page that displays detailed information about a selected news article.

### Services

- **`api_service.dart`**: Handles API requests and data fetching from news sources.

### Main

- **`main.dart`**: The entry point of the application that initializes the app and sets up the routes.

## Screenshots

## Contribution

Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request. For major changes, please open an issue to discuss what you would like to change.

Thank you for using the News App!

