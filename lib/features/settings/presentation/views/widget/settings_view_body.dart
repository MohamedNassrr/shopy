import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var langCubit = context.read<LocalizationCubit>();
    var darkModeCubit = context.read<DarkModeCubit>();
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
                value: langCubit.currentLocale.languageCode,
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
                    langCubit.changeCurrentLang(value);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Dark Mode Row
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
                value: darkModeCubit.isLight,
                activeColor: Colors.white,
                onChanged: (_) {
                  darkModeCubit.changeAppMode();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
