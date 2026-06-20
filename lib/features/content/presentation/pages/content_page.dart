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
