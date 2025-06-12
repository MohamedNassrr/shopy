import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'English';
    var settingCubit = BlocProvider.of<SettingsCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Language Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.language),
                  SizedBox(width: 8),
                  Text('Language'),
                ],
              ),
              DropdownButton(
                value: selectedLanguage,
                style: Theme.of(context).textTheme.bodyMedium,
                items: const [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'Arabic',
                    child: Text('Arabic'),
                  ),
                ],
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Dark Mode Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.dark_mode),
                  SizedBox(width: 8),
                  Text('Dark Mode'),
                ],
              ),
              Switch(
                value: settingCubit.isLight,
                onChanged: (_) {
                  settingCubit.changeAppMode();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
