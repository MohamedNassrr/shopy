import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var appSettingCubit = context.read<SettingsCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.settings,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Language Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 8),
                  Text(lang.language),
                ],
              ),
              DropdownButton(
                value: appSettingCubit.currentLocale.languageCode,
                style: Theme.of(context).textTheme.bodyMedium,
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('العربية'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    appSettingCubit.changeCurrentLang(value);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
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
          ),
        ],
      ),
    );
  }
}
