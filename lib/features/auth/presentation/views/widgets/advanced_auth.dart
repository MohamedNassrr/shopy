import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';

class AdvancedAuth extends StatelessWidget {
  const AdvancedAuth({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        InkWell(
          onTap: () {
            cubit.signInWithGoogle();
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  AssetsData.googleLogo,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  AssetsData.facebookLogo,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}