import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/mock_data_service.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/tutors/presentation/pages/tutors_page.dart';
import 'features/students/presentation/pages/students_page.dart';
import 'features/sessions/presentation/pages/sessions_page.dart';
import 'features/financials/presentation/pages/financials_page.dart';
import 'features/analytics/presentation/pages/analytics_page.dart';
import 'features/content/presentation/pages/content_page.dart';
import 'features/notifications/presentation/pages/notifications_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';

void main() {
  runApp(const TutorAdminApp());
}

class TutorAdminApp extends StatelessWidget {
  const TutorAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorLink Admin',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const MainMobileLayout(),
    );
  }
}

class MainMobileLayout extends StatefulWidget {
  const MainMobileLayout({super.key});

  @override
  State<MainMobileLayout> createState() => _MainMobileLayoutState();
}

class _MainMobileLayoutState extends State<MainMobileLayout> {
  int _currentIndex = 0;
  int _moreTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(bottom: false, child: _buildBody()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textMuted,
          elevation: 8,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.school_rounded), label: 'Tutors'),
            BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: 'Students'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Sessions'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded), label: 'More'),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const DashboardPage();
      case 1:
        return const TutorsPage();
      case 2:
        return const StudentsPage();
      case 3:
        return const SessionsPage();
      case 4:
        return _buildMoreTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMoreTab() {
    final tabs = [
      ('Financials', const FinancialsPage()),
      ('Analytics', const AnalyticsPage()),
      ('Content', const ContentPage()),
      ('Notifications', const NotificationsPage()),
      ('Settings', const SettingsPage()),
    ];

    return Column(
      children: [
        Container(
          color: AppColors.surface,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: List.generate(tabs.length, (index) {
                final isSelected = _moreTabIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _moreTabIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : AppColors.card,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.divider,
                        ),
                      ),
                      child: Text(
                        tabs[index].$1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Expanded(child: tabs[_moreTabIndex].$2),
      ],
    );
  }
}
