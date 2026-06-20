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
