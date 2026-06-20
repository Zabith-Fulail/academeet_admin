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
