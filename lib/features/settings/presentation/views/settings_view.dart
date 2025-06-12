import 'package:flutter/material.dart';
import 'package:online_shop_app/features/settings/presentation/views/widget/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SettingsViewBody(),
      ),
    );
  }
}
