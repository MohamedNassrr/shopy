import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextsStyles.textStyle14,
          ),
          SizedBox(
            height: 13,
          ),
          SizedBox(
            height: 78,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.imageIcon.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: (){
                    debugPrint('item pressed');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .055,
                        width: MediaQuery.of(context).size.width * .13,
                        decoration: BoxDecoration(
                            color: Color(0xffEDF7FF),
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(
                          cubit.imageIcon[index],
                        ),
                      ),
                      Text(
                        cubit.categoryTitles[index],
                        style: TextsStyles.textStyle12.copyWith(
                          color: Color(0xff939393),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
