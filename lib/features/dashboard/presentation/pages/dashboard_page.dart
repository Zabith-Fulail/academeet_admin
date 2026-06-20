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
