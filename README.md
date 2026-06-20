# TutorLink Admin Panel

A modern, professional Flutter admin dashboard for managing the TutorLink platform - Sri Lanka's premier O/L & A/L personal tutoring marketplace.

## 🎯 Features

### Core Admin Functionality
- **Tutor Management** - Verify qualifications, manage tutor profiles, suspend/approve accounts
- **Student Management** - Monitor student accounts and activity
- **Session Management** - Track ongoing, completed, and cancelled sessions
- **Financial Dashboard** - Monitor revenue, process payouts, view transaction history
- **Analytics** - Detailed charts showing platform metrics and performance
- **Content Management** - Manage O/L & A/L subjects and syllabus
- **Notifications** - Send push notifications and announcements to users
- **Settings** - Configure force updates, business rules, maintenance mode

### Technical Highlights
- **Clean Architecture** - Proper separation of concerns with entities, repositories, and use cases
- **State Management** - Cubit-based state management with BLoC pattern
- **Professional UI/UX** - Beautiful dark theme with consistent design language
- **Responsive Design** - Works seamlessly on desktop and tablet
- **Mock Data** - Pre-populated with realistic tutor, student, and session data

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart       # App-wide constants
│   ├── entities/
│   │   └── entities.dart            # Domain entities
│   ├── router/
│   │   └── app_router.dart          # Navigation routes
│   ├── theme/
│   │   └── app_theme.dart           # Theme & styling
│   ├── utils/
│   │   └── mock_data_service.dart   # Mock data provider
│   └── widgets/
│       ├── app_scaffold.dart        # Layout wrapper
│       ├── app_sidebar.dart         # Navigation sidebar
│       └── shared_widgets.dart      # Reusable components
├── features/
│   ├── dashboard/                   # Dashboard feature
│   ├── tutors/                      # Tutor management
│   ├── students/                    # Student management
│   ├── sessions/                    # Session tracking
│   ├── financials/                  # Financial management
│   ├── analytics/                   # Analytics & reports
│   ├── content/                     # Content management
│   ├── notifications/               # Notification system
│   └── settings/                    # App settings
└── main.dart                        # Entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter 3.10.0 or higher
- Dart 3.0.0 or higher

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/tutor_admin.git
cd tutor_admin
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d web
# or for desktop
flutter run -d windows
flutter run -d macos
flutter run -d linux
```

## 📦 Dependencies

- **flutter_bloc** - State management
- **go_router** - Navigation & routing
- **fl_chart** - Beautiful charts and graphs
- **intl** - Internationalization utilities
- **uuid** - UUID generation
- **equatable** - Value equality
- **dartz** - Functional programming utilities

## 🎨 Theme & Colors

The app uses a professional dark navy theme with teal accents:

- **Primary Color**: `#1E6B9E` (Ocean Blue)
- **Accent Color**: `#00C897` (Teal)
- **Warning Color**: `#FFB84D` (Amber)
- **Error Color**: `#FF5C72` (Red)
- **Background**: `#0F1923` (Dark Navy)

## 🔐 Authentication & Security

Currently uses mock data for demonstration. To integrate real backend:

1. Replace `MockDataService` with actual API calls
2. Implement authentication with your backend
3. Add token-based authorization to all API calls
4. Implement proper error handling and logging

## 📊 Sample Data

The app comes pre-loaded with:
- 10 tutor profiles (verified, pending, and rejected)
- 12 student accounts
- 20 session records
- Full transaction history
- Realistic analytics data

## 🌐 Supported Platforms

- Web (recommended for admin use)
- Windows Desktop
- macOS Desktop
- Linux Desktop

## 🎓 Sri Lanka Specific Features

- **O/L Subjects**: Mathematics, Science, English, Sinhala, Tamil, History, Geography, etc.
- **A/L Streams**: Physical Science, Biological Science, Commerce, Arts, Technology
- **Teaching Mediums**: Sinhala Medium, Tamil Medium, English Medium
- **25+ Districts**: Full coverage of Sri Lankan districts

## 📝 Notes for Developers

### State Management Pattern
All features follow a consistent Cubit pattern:
```dart
// Load initial data
Future<void> load() async {
  emit(Loading());
  // Fetch data
  emit(Loaded(data));
}

// Handle user actions
void action() {
  // Process
  emit(Success()); // or Error()
}
```

### Adding New Features
1. Create feature folder under `lib/features/`
2. Add entities, cubits, and pages
3. Update router in `app_router.dart`
4. Add navigation item in `app_sidebar.dart`

### Design System
Always use constants from `AppTheme`:
- Colors: `AppColors.primary`, `AppColors.accent`, etc.
- Spacing: `AppSpacing.sm`, `AppSpacing.md`, `AppSpacing.lg`
- Border Radius: `AppRadius.sm`, `AppRadius.md`, `AppRadius.lg`
- Text Styles: `AppTextStyles.h1`, `AppTextStyles.body`, etc.

## 🤝 Contributing

1. Follow the existing code structure
2. Use meaningful variable and function names
3. Add comments for complex logic
4. Test on multiple screen sizes
5. Ensure no console errors or warnings

## 📄 License

This project is proprietary software for TutorLink platform.

## 👨‍💻 Support

For questions or issues, please contact: dev@tutorlink.lk

## 🗺️ Roadmap

- [ ] Real backend API integration
- [ ] User authentication system
- [ ] Advanced reporting & exports
- [ ] Real-time session monitoring
- [ ] Custom commission rules per tutor
- [ ] Dispute resolution system
- [ ] Student testimonials management
- [ ] Mobile app linking
- [ ] Payment gateway integration
- [ ] SMS notifications support

---

**Built with ❤️ for Sri Lanka's education ecosystem**
