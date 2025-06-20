import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/views/widget/dark_mode_switching.dart';
import 'package:online_shop_app/features/settings/presentation/views/widget/language_selection.dart';
import 'package:online_shop_app/features/settings/presentation/views/widget/signout_bloc_consumer.dart';
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
          LanguageSelection(lang: lang, appSettingCubit: appSettingCubit),
          const SizedBox(height: 16),
          DarkModeSwitching(lang: lang, appSettingCubit: appSettingCubit),
          const SignOutBlocConsumer(),
        ],
      ),
    );
  }
}
