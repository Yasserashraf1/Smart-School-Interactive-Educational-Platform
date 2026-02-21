# Smart School
### Interactive Educational Platform for Egyptian Secondary Students

*Bridging traditional education with modern digital engagement*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue)
![Status](https://img.shields.io/badge/Status-MVP%20Released-brightgreen)

</div>

---

##  Overview

**Smart School** is a comprehensive, offline-capable Flutter application engineered to modernize the study experience for Egyptian secondary school students. The platform transforms conventional learning into an engaging, gamified journey — giving students access to rich multimedia content, interactive quizzes, and personalized progress tracking, all from their mobile device.

> Built from the ground up by a sole Flutter developer, the app demonstrates a production-ready architecture with clean, scalable code and a student-centric UI/UX philosophy.

---

## Key Features

### Structured Learning Modules
Subjects and lessons are organized within an intuitive navigation system (Home → Subjects → Lessons), making it easy for students to find and follow their curriculum.

### Rich Media Integration
Embedded YouTube player and external resource linking deliver diverse study materials — video lectures, articles, and more — directly inside the app without switching contexts.

### Interactive Assessments
A dynamic quiz engine presents questions, captures student responses, and delivers immediate, actionable feedback to reinforce learning at the right moment.

### Gamification & Engagement
- **Lottie Animations** — fluid, expressive micro-interactions
- **Confetti Celebrations** — reward students on achievements
- **Percent Indicators** — visual progress bars that motivate continued effort

### Offline-First Capabilities
Local SQLite storage ensures students can access their progress, lessons, and saved data anytime — even without an internet connection.

### Personalized User Profiles
An engaging onboarding flow with customizable user profiles and an interactive **avatar selection** system gives each student a sense of ownership over their learning experience.

### Progress Tracking & Analytics
A comprehensive dashboard lets students monitor subject progress, track quiz performance over time, and identify areas that need more attention.

### Localization (L10n)
Fully configured with Flutter's internationalization support, enabling seamless multi-language flexibility for future expansion.

---

## Technical Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter (Dart) |
| **State Management** | Provider |
| **Local Database** | SQLite (`sqflite`) |
| **Local Caching** | Shared Preferences (`shared_preferences`) |
| **Video Player** | `youtube_player_flutter` |
| **Animations** | `lottie`, `confetti` |
| **UI Components** | `percent_indicator`, `smooth_page_indicator`, `cupertino_icons` |
| **Typography** | `google_fonts` |
| **Architecture** | Feature-based Modular Architecture |

---

## Architecture

The project follows a **Feature-based Modular Architecture**, separating concerns by feature domain rather than technical layer. This ensures high maintainability, independent scalability of features, and a clean codebase that grows gracefully.

```
lib/
├── core/                    # Shared utilities, constants, themes
│   ├── database/            # SQLite database helper & migrations
│   ├── theme/               # App-wide theming & typography
│   └── utils/               # Helper functions, extensions
├── features/
│   ├── onboarding/          # User onboarding & avatar selection
│   ├── home/                # Home dashboard
│   ├── subjects/            # Subject listing & management
│   ├── lessons/             # Lesson content, video player, resources
│   ├── quiz/                # Quiz engine, results, feedback
│   ├── profile/             # User profile management
│   └── progress/            # Analytics & progress tracking
├── l10n/                    # Localization (ARB files)
└── main.dart
```

---


##  Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code with Flutter plugin
- An Android or iOS device / emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/smart-school.git
   cd smart-school
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

### Build for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  provider: ^6.x.x

  # Local Storage
  sqflite: ^2.x.x
  shared_preferences: ^2.x.x

  # Media
  youtube_player_flutter: ^8.x.x

  # Animations
  lottie: ^2.x.x
  confetti: ^0.7.x

  # UI
  google_fonts: ^6.x.x
  percent_indicator: ^4.x.x
  smooth_page_indicator: ^1.x.x
  cupertino_icons: ^1.x.x
```

> Pin exact versions in your `pubspec.yaml` for reproducible builds.

---

## Roadmap

- [ ] Backend API integration (REST / Firebase)
- [ ] Push notifications for study reminders
- [ ] Live tutoring / chat feature
- [ ] Expanded subject & grade coverage
- [ ] Dark mode support
- [ ] Parent / teacher dashboard
- [ ] Leaderboards and social challenges

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Developer

<div align="center">

**Built with ❤️ by [Yasser Ashraf]**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/yasserashraf/) 

*"Modernizing education, one screen at a time."*

</div>
