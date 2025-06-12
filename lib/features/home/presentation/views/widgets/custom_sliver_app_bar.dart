import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_states.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedLocation;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeSetLocationNameStates) {
            selectedLocation = state.locationName;
          }
        },
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          return SliverAppBar(
            pinned: true,
            leading: Image.asset(
              AssetsData.shopyIcon,
            ),
            titleSpacing: 5,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Text(
                      'Delivery address',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                InkWell(
                    onTap: () async {
                      final result = await GoRouter.of(context)
                          .push<Map<String, dynamic>>(
                              AppRouter.rGoogleMapsView);
                      if (result != null && result['placeName'] != null) {
                        homeCubit.setLocation(result['placeName']);
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 170,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            selectedLocation ?? 'select your delivery address',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                      ],
                    )),
              ],
            ),

          );
        },
      ),
    );
  }
}
