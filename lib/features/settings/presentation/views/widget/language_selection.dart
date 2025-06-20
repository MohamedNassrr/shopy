import 'package:flutter/material.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({
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
    );
  }
}