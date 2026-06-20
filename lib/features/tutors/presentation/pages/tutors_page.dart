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
