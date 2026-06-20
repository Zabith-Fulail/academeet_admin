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
