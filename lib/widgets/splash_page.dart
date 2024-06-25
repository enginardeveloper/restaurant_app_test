import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/app_theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(

        child: CircularProgressIndicator(
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
