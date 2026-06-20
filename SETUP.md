# TutorLink Admin Panel - Setup Guide

## Quick Start

### Step 1: Extract the Project
```bash
unzip tutor_admin.zip
cd tutor_admin
```

### Step 2: Install Dependencies
```bash
flutter clean
flutter pub get
```

### Step 3: Run the App

**For Web (Recommended for Admin Dashboard):**
```bash
flutter run -d chrome
# or
flutter run -d web
```

**For Windows Desktop:**
```bash
flutter run -d windows
```

**For macOS:**
```bash
flutter run -d macos
```

**For Linux:**
```bash
flutter run -d linux
```

## ✨ Features Walkthrough

### 1. Dashboard (Home)
- Real-time platform statistics
- Weekly revenue chart
- Session distribution by subject
- Recent sessions list
- Top tutors leaderboard
- Quick action buttons for pending verifications

### 2. Tutor Management
- Browse all registered tutors (verified, pending, rejected)
- Filter by status (Pending, Verified, Rejected, Suspended)
- Filter by exam level (O/L, A/L)
- Search by name, email, or district
- Approve/Reject pending applications
- View tutor details and qualifications
- Suspend verified tutors if needed
- Track tutor earnings and session count

### 3. Student Management
- View all registered students
- Filter by status (Active, Suspended)
- Search students by name, district, or email
- See student booking history
- Track total spending per student
- Monitor registration dates

### 4. Session Management
- Track all platform sessions
- Filter by session status:
  - Pending (awaiting student confirmation)
  - Confirmed (accepted by tutor)
  - Ongoing (currently in progress)
  - Completed (finished successfully)
  - Cancelled (cancelled by either party)
- Search sessions by student, tutor, or subject
- View session ratings and reviews
- Monitor district-wise distribution

### 5. Financials & Payouts
- Monitor total platform revenue
- Track pending payouts (awaiting weekend batch)
- View released payouts (already paid to tutors)
- Transaction history with all details:
  - Gross amount
  - Platform commission (15%)
  - Net amount to tutor
- Process weekend payout batch
- Financial breakdown pie chart

### 6. Analytics
- Key metrics summary (Total tutors, students, revenue, sessions)
- Sessions by district bar chart
- Revenue trend over last 7 days
- Tutor performance table with:
  - Rating scores
  - Session count
  - Total earnings
  - Response rate (%)

### 7. Content Management
- **O/L Subjects Tab**
  - Add/remove O/L subjects
  - Managed list of available subjects
  
- **A/L Streams Tab**
  - Manage all 5 A/L streams:
    - Physical Science
    - Biological Science
    - Commerce
    - Arts
    - Technology
  - Add/remove subjects within each stream
  - Update as syllabus changes

### 8. Notifications & Announcements
- **Send Notifications Panel** (Left side)
  - Select target audience (All Users, Students, Tutors)
  - Write notification title and body
  - Preview recipient count
  
- **Notification History** (Right side)
  - View all sent notifications
  - See send time, message, and recipient count
  - Color-coded by target audience

### 9. Settings
- **Force Update Control**
  - Enable/disable app force updates
  - Set minimum required version
  - Customize update message
  
- **Business Rules**
  - Adjust platform commission percentage (5-30%)
  - Configure tutor response window (6-24 hours)
  
- **Maintenance Mode**
  - Enable/disable maintenance
  - Shows maintenance screen to users
  - Admin panel remains accessible
  
- **App Information**
  - Version details
  - Platform info
  - Payout schedule
  - District coverage

## 🎯 Sample Data

The app comes with realistic mock data:

**10 Tutors:**
- Mix of verified, pending, and rejected
- Various exam levels and specializations
- Different teaching mediums (Sinhala, Tamil, English)
- Realistic ratings and earnings

**12 Students:**
- Different exam levels (O/L, A/L)
- Various districts across Sri Lanka
- Different booking patterns
- One suspended account for testing

**20 Sessions:**
- Mix of all session statuses
- Completed sessions with ratings
- Recent activity with student notes

## 🔄 Navigation

**Sidebar Navigation:**
- Dashboard (top priority stats)
- Tutors (management hub)
- Students (user accounts)
- Sessions (session tracking)
- Financials (revenue & payouts)
- Analytics (detailed reports)
- Content (subjects management)
- Notifications (announcements)
- Settings (configuration)

## 🎨 Design System

**Colors:**
- Primary: Ocean Blue (#1E6B9E)
- Accent: Teal (#00C897)
- Success: Green (#00C897)
- Warning: Orange (#FFB84D)
- Error: Red (#FF5C72)
- Info: Light Blue (#4DAEFF)

**Spacing:**
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px

**Border Radius:**
- sm: 6px
- md: 10px
- lg: 14px
- xl: 20px

## 💡 Tips & Best Practices

1. **Tutor Verification Workflow:**
   - Check qualifications in detail view
   - Verify documents before approving
   - Add rejection reason if needed
   - Track approval rate

2. **Financial Management:**
   - Review transactions weekly
   - Process payouts on time (Saturday batches)
   - Monitor commission rate effectiveness
   - Track platform revenue trends

3. **Content Updates:**
   - Update syllabus when NIE announces changes
   - Add new subjects as demand grows
   - Remove discontinued subjects
   - Maintain consistent subject naming

4. **Notifications Strategy:**
   - Target specific audiences
   - Send exam season reminders
   - Notify tutors of system updates
   - Announce new features to students

5. **Performance Monitoring:**
   - Monitor top tutor performance
   - Track session completion rates
   - Identify problem districts
   - Review student satisfaction

## 🔌 API Integration (Future)

Currently using mock data. To integrate real API:

1. Replace `MockDataService` with API calls
2. Implement authentication
3. Add error handling
4. Set up interceptors for tokens
5. Cache data appropriately
6. Handle network errors

## 📱 Responsive Behavior

- **Desktop (1200px+):** Full sidebar + main content
- **Tablet (900px-1199px):** Collapsible sidebar
- **Mobile:** Not intended for mobile (admin use)

## 🐛 Troubleshooting

**App won't start:**
```bash
flutter clean
flutter pub get
flutter pub cache repair
```

**Build errors:**
- Ensure Flutter version is 3.10.0+
- Run `flutter doctor` to check setup
- Check iOS/Android native setup if running on device

**UI looks off:**
- Force complete refresh
- Clear Flutter cache: `rm -rf ~/.flutter`
- Rebuild completely: `flutter clean && flutter pub get`

## 📞 Support

For issues or questions:
1. Check the README.md
2. Review the code comments
3. Check Flutter/Dart documentation
4. Contact development team

## 🎓 Learning Resources

- Clean Architecture: Study the `core/` and `features/` structure
- BLoC/Cubit: Check `*_cubit.dart` files for state management
- Flutter Widgets: Review `shared_widgets.dart` for reusable components
- Theme: Study `app_theme.dart` for design system

---

**Happy administrating! 🚀**
