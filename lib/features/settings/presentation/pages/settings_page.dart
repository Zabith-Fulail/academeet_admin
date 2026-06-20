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
