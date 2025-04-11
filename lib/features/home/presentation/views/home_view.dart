import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            selectedItemColor: primaryColor,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
              items: cubit.bottomNavItem
          ),
        );
      },     
    );
  }
}
