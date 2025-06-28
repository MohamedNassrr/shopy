import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_states.dart';
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
    return BlocListener<SettingsCubit,SettingsStates>(
      listener: (context, state) {
        if(state is AppLocaleChangedState){
          if(state is AppThemeChangedState){
            GoRouter.of(context).pushReplacement(AppRouter.rHomeView);
          }
        }
      },
      child: Row(
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
    );
  }
}