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
