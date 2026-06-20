class AppConstants {
static const appName = 'TutorLink Admin';
static const olSubjects = ['Math', 'Science', 'English', 'Sinhala', 'Tamil', 'History'];
static const teachingMediums = ['Sinhala', 'Tamil', 'English'];
}
import 'package:equatable/equatable.dart';

enum TutorStatus { pending, verified, rejected, suspended }
enum SessionStatus { pending, confirmed, ongoing, completed, cancelled }

class TutorEntity extends Equatable {
final String id;
final String fullName;
final String email;
final TutorStatus status;
final double rating;
final int totalSessions;

const TutorEntity({
required this.id,
required this.fullName,
required this.email,
required this.status,
required this.rating,
required this.totalSessions,
});

@override List<Object?> get props => [id];
}

class StudentEntity extends Equatable {
final String id;
final String fullName;
final String email;
final int totalBookings;

const StudentEntity({
required this.id,
required this.fullName,
required this.email,
required this.totalBookings,
});

@override List<Object?> get props => [id];
}

class SessionEntity extends Equatable {
final String id;
final String studentName;
final String tutorName;
final String subject;
final SessionStatus status;
final double amount;

const SessionEntity({
required this.id,
required this.studentName,
required this.tutorName,
required this.subject,
required this.status,
required this.amount,
});

@override List<Object?> get props => [id];
}
import 'package:flutter/material.dart';

class AppColors {
static const primary = Color(0xFF1E6B9E);
static const primaryDark = Color(0xFF14507A);
static const accent = Color(0xFF00C897);
static const background = Color(0xFF0F1923);
static const surface = Color(0xFF1A2738);
static const card = Color(0xFF1E2E42);
static const textPrimary = Color(0xFFF0F4F8);
static const textSecondary = Color(0xFF8FA3B8);
static const textMuted = Color(0xFF4D6478);
static const success = Color(0xFF00C897);
static const warning = Color(0xFFFFB84D);
static const error = Color(0xFFFF5C72);
static const info = Color(0xFF4DAEFF);
static const divider = Color(0xFF253545);
}

class AppTextStyles {
static const h1 = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
static const h2 = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
static const h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
static const h4 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
static const body = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
static const label = TextStyle(fontSize: 13, fontWeight: FontWeight.w500);
static const caption = TextStyle(fontSize: 11, fontWeight: FontWeight.w400);
}

class AppSpacing {
static const xs = 4.0;
static const sm = 8.0;
static const md = 16.0;
static const lg = 24.0;
static const xl = 32.0;
}

class AppTheme {
static ThemeData get darkTheme => ThemeData(
useMaterial3: true,
brightness: Brightness.dark,
scaffoldBackgroundColor: AppColors.background,
colorScheme: const ColorScheme.dark(primary: AppColors.primary),
);
}
import 'package:uuid/uuid.dart';
import '../entities/app_entities.dart';

class MockDataService {
static final MockDataService _instance = MockDataService._internal();
factory MockDataService() => _instance;
MockDataService._internal();

final _uuid = const Uuid();

Future<List<TutorEntity>> getTutors() async {
await Future.delayed(const Duration(milliseconds: 500));
return [
TutorEntity(
id: _uuid.v4(),
fullName: 'Ruwan Perera',
email: 'ruwan@gmail.com',
status: TutorStatus.verified,
rating: 4.5,
totalSessions: 50,
),
TutorEntity(
id: _uuid.v4(),
fullName: 'Nadeesha Silva',
email: 'nadeesha@gmail.com',
status: TutorStatus.pending,
rating: 0,
totalSessions: 0,
),
];
}

Future<List<StudentEntity>> getStudents() async {
await Future.delayed(const Duration(milliseconds: 500));
return [
StudentEntity(
id: _uuid.v4(),
fullName: 'Hiruni Perera',
email: 'hiruni@gmail.com',
totalBookings: 5,
),
StudentEntity(
id: _uuid.v4(),
fullName: 'Ashen Silva',
email: 'ashen@gmail.com',
totalBookings: 3,
),
];
}

Future<List<SessionEntity>> getSessions() async {
await Future.delayed(const Duration(milliseconds: 500));
return [
SessionEntity(
id: _uuid.v4(),
studentName: 'Hiruni',
tutorName: 'Ruwan',
subject: 'Mathematics',
status: SessionStatus.completed,
amount: 2500,
),
];
}
}
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../entities/app_entities.dart';

class StatCard extends StatelessWidget {
final String title;
final String value;
final IconData icon;
final Color color;

const StatCard({super.key,
required this.title,
required this.value,
required this.icon,
required this.color,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(AppSpacing.md),
decoration: BoxDecoration(
color: AppColors.card,
borderRadius: BorderRadius.circular(12),
border: Border.all(color: AppColors.divider),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(icon, color: color, size: 15),
const SizedBox(height: AppSpacing.md),
Text(value, style: AppTextStyles.h3),
Text(title, style: AppTextStyles.body),
],
),
);
}
}

class StatusBadge extends StatelessWidget {
final String label;
final Color color;

const StatusBadge({required this.label, required this.color});

factory StatusBadge.tutorStatus(TutorStatus status) {
switch (status) {
case TutorStatus.verified:
return const StatusBadge(label: 'Verified', color: AppColors.success);
case TutorStatus.pending:
return const StatusBadge(label: 'Pending', color: AppColors.warning);
default:
return const StatusBadge(label: 'Inactive', color: AppColors.error);
}
}

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
decoration: BoxDecoration(
color: color.withOpacity(0.12),
borderRadius: BorderRadius.circular(20),
),
child: Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
);
}
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AnalyticsPage extends StatelessWidget {
const AnalyticsPage({super.key});

@override
Widget build(BuildContext context) {
return Center(
child: Text('Analytics', style: AppTextStyles.h3),
);
}
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ContentPage extends StatelessWidget {
const ContentPage({super.key});

@override
Widget build(BuildContext context) {
return Center(
child: Text('Content Management', style: AppTextStyles.h3),
);
}
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class DashboardState extends Equatable {
@override List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
final int totalTutors;
final int totalStudents;
final int totalSessions;
final double revenue;
DashboardLoaded(this.totalTutors, this.totalStudents, this.totalSessions, this.revenue);
@override List<Object?> get props => [totalTutors];
}
class DashboardError extends DashboardState {
final String message;
DashboardError(this.message);
}

class DashboardCubit extends Cubit<DashboardState> {
final MockDataService _service;
DashboardCubit(this._service) : super(DashboardInitial());

Future<void> load() async {
emit(DashboardLoading());
try {
final tutors = await _service.getTutors();
final students = await _service.getStudents();
final sessions = await _service.getSessions();
emit(DashboardLoaded(tutors.length, students.length, sessions.length, 28500));
} catch (e) {
emit(DashboardError(e.toString()));
}
}
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/mock_data_service.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../cubits/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
const DashboardPage({super.key});

@override
Widget build(BuildContext context) {
return BlocProvider(
create: (_) => DashboardCubit(MockDataService())..load(),
child: BlocBuilder<DashboardCubit, DashboardState>(
builder: (context, state) {
if (state is DashboardLoading) {
return const Center(child: CircularProgressIndicator(color: AppColors.primary));
}
if (state is DashboardLoaded) {
return SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
gradient: const LinearGradient(colors: [AppColors.primaryDark, AppColors.primary]),
borderRadius: BorderRadius.circular(12),
),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Welcome Admin! 👋', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
Text('Manage your platform', style: TextStyle(color: Colors.white70, fontSize: 14)),
],
),
),
const SizedBox(height: 24),
const Text('Key Metrics', style: AppTextStyles.h3),
const SizedBox(height: 12),
GridView.count(
crossAxisCount: 2,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
mainAxisSpacing: 12,
crossAxisSpacing: 12,
childAspectRatio: 1.5,
children: [
StatCard(title: 'Tutors', value: '${state.totalTutors}', icon: Icons.school_rounded, color: AppColors.primary),
StatCard(title: 'Students', value: '${state.totalStudents}', icon: Icons.people_rounded, color: AppColors.accent),
StatCard(title: 'Sessions', value: '${state.totalSessions}', icon: Icons.calendar_month, color: AppColors.info),
StatCard(title: 'Revenue', value: 'Rs. ${state.revenue.toInt()}', icon: Icons.trending_up_rounded, color: AppColors.warning),
],
),
],
),
);
}
return const Center(child: Text('Error'));
},
),
);
}
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/shared_widgets.dart';

class FinancialsPage extends StatelessWidget {
const FinancialsPage({super.key});

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
children: [
GridView.count(
crossAxisCount: 2,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
mainAxisSpacing: 12,
crossAxisSpacing: 12,
childAspectRatio: 1.5,
children: [
StatCard(title: 'Revenue', value: 'Rs. 28.5K', icon: Icons.trending_up_rounded, color: AppColors.primary),
StatCard(title: 'Payouts', value: 'Rs. 24.2K', icon: Icons.payment_rounded, color: AppColors.accent),
],
),
],
),
);
}
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NotificationsPage extends StatelessWidget {
const NotificationsPage({super.key});

@override
Widget build(BuildContext context) {
return Center(
child: Text('Notifications', style: AppTextStyles.h3),
);
}
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class SessionsState extends Equatable {
@override List<Object?> get props => [];
}
class SessionsInitial extends SessionsState {}
class SessionsLoading extends SessionsState {}
class SessionsLoaded extends SessionsState {
final List<SessionEntity> sessions;
SessionsLoaded(this.sessions);
@override List<Object?> get props => [sessions];
}

class SessionsCubit extends Cubit<SessionsState> {
final MockDataService _service;
SessionsCubit(this._service) : super(SessionsInitial());

Future<void> load() async {
emit(SessionsLoading());
final sessions = await _service.getSessions();
emit(SessionsLoaded(sessions));
}
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/mock_data_service.dart';
import '../cubits/sessions_cubit.dart';

class SessionsPage extends StatelessWidget {
const SessionsPage({super.key});

@override
Widget build(BuildContext context) {
return BlocProvider(
create: (_) => SessionsCubit(MockDataService())..load(),
child: BlocBuilder<SessionsCubit, SessionsState>(
builder: (context, state) {
if (state is SessionsLoading) return const Center(child: CircularProgressIndicator(color: AppColors.primary));
if (state is SessionsLoaded) {
return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: state.sessions.length,
itemBuilder: (context, i) {
final s = state.sessions[i];
return Container(
margin: const EdgeInsets.only(bottom: 12),
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.divider)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(s.subject, style: AppTextStyles.h4),
Text('${s.studentName} → ${s.tutorName}', style: AppTextStyles.body),
const SizedBox(height: 8),
Text('Rs. ${s.amount.toInt()}', style: AppTextStyles.label),
],
),
);
},
);
}
return const SizedBox.shrink();
},
),
);
}
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
const SettingsPage({super.key});

@override
State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
double _commission = 15.0;
int _response = 12;

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
children: [
Container(
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: AppColors.card,
borderRadius: BorderRadius.circular(12),
border: Border.all(color: AppColors.divider),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Commission Rate', style: AppTextStyles.h4),
const SizedBox(height: 12),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text('Rate %', style: AppTextStyles.body),
Text('${_commission.toStringAsFixed(1)}%', style: AppTextStyles.h4),
],
),
Slider(
value: _commission,
min: 5,
max: 30,
activeColor: AppColors.primary,
onChanged: (v) => setState(() => _commission = v),
),
],
),
),
const SizedBox(height: 16),
Container(
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: AppColors.card,
borderRadius: BorderRadius.circular(12),
border: Border.all(color: AppColors.divider),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Response Window', style: AppTextStyles.h4),
const SizedBox(height: 12),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text('Hours', style: AppTextStyles.body),
Text('${_response}h', style: AppTextStyles.h4),
],
),
Slider(
value: _response.toDouble(),
min: 6,
max: 24,
activeColor: AppColors.primary,
onChanged: (v) => setState(() => _response = v.toInt()),
),
],
),
),
],
),
);
}
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class StudentsState extends Equatable {
@override List<Object?> get props => [];
}
class StudentsInitial extends StudentsState {}
class StudentsLoading extends StudentsState {}
class StudentsLoaded extends StudentsState {
final List<StudentEntity> students;
StudentsLoaded(this.students);
@override List<Object?> get props => [students];
}

class StudentsCubit extends Cubit<StudentsState> {
final MockDataService _service;
StudentsCubit(this._service) : super(StudentsInitial());

Future<void> load() async {
emit(StudentsLoading());
final students = await _service.getStudents();
emit(StudentsLoaded(students));
}
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/mock_data_service.dart';
import '../cubits/students_cubit.dart';

class StudentsPage extends StatelessWidget {
const StudentsPage({super.key});

@override
Widget build(BuildContext context) {
return BlocProvider(
create: (_) => StudentsCubit(MockDataService())..load(),
child: BlocBuilder<StudentsCubit, StudentsState>(
builder: (context, state) {
if (state is StudentsLoading) return const Center(child: CircularProgressIndicator(color: AppColors.primary));
if (state is StudentsLoaded) {
return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: state.students.length,
itemBuilder: (context, i) {
final s = state.students[i];
return Container(
margin: const EdgeInsets.only(bottom: 12),
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.divider)),
child: Row(
children: [
CircleAvatar(backgroundColor: AppColors.accent, child: Text(s.fullName[0])),
const SizedBox(width: 12),
Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Text(s.fullName, style: AppTextStyles.h4),
Text(s.email, style: AppTextStyles.body),
])),
Text('${s.totalBookings}', style: AppTextStyles.h4),
],
),
);
},
);
}
return const SizedBox.shrink();
},
),
);
}
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/entities/app_entities.dart';
import '../../../../core/utils/mock_data_service.dart';

abstract class TutorsState extends Equatable {
@override List<Object?> get props => [];
}
class TutorsInitial extends TutorsState {}
class TutorsLoading extends TutorsState {}
class TutorsLoaded extends TutorsState {
final List<TutorEntity> tutors;
TutorsLoaded(this.tutors);
@override List<Object?> get props => [tutors];
}

class TutorsCubit extends Cubit<TutorsState> {
final MockDataService _service;
TutorsCubit(this._service) : super(TutorsInitial());

Future<void> load() async {
emit(TutorsLoading());
final tutors = await _service.getTutors();
emit(TutorsLoaded(tutors));
}
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/mock_data_service.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../cubits/tutors_cubit.dart';

class TutorsPage extends StatelessWidget {
const TutorsPage({super.key});

@override
Widget build(BuildContext context) {
return BlocProvider(
create: (_) => TutorsCubit(MockDataService())..load(),
child: BlocBuilder<TutorsCubit, TutorsState>(
builder: (context, state) {
if (state is TutorsLoading) {
return const Center(child: CircularProgressIndicator(color: AppColors.primary));
}
if (state is TutorsLoaded) {
return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: state.tutors.length,
itemBuilder: (context, i) {
final t = state.tutors[i];
return Container(
margin: const EdgeInsets.only(bottom: 12),
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: AppColors.card,
borderRadius: BorderRadius.circular(10),
border: Border.all(color: AppColors.divider),
),
child: Row(
children: [
CircleAvatar(backgroundColor: AppColors.primary, child: Text(t.fullName[0])),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(t.fullName, style: AppTextStyles.h4),
Text(t.email, style: AppTextStyles.body),
],
),
),
StatusBadge.tutorStatus(t.status),
],
),
);
},
);
}
return const SizedBox.shrink();
},
),
);
}
}
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
