import 'package:flutter/material.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class DarkModeSwitching extends StatelessWidget {
  const DarkModeSwitching({
    super.key,
    required this.lang,
    required this.appSettingCubit,
  });

  final S lang;
  final SettingsCubit appSettingCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.dark_mode),
            const SizedBox(width: 8),
            Text(lang.darkMode),
          ],
        ),
        Switch(
          value: appSettingCubit.isDark,
          activeColor: Colors.white,
          onChanged: (_) {
            appSettingCubit.setAppMode();
          },
        ),
      ],
    );
  }
}