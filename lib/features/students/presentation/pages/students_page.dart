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
