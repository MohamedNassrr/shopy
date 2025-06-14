import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';
import 'package:online_shop_app/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                ),
                label: S.of(context).homeBottomNav,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                ),
                label: S.of(context).cartBottomNav,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  FontAwesomeIcons.user,
                ),
                label: S.of(context).profileBottomNav,
              ),
            ],
          ),
        );
      },
    );
  }
}
