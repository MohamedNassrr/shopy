import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';

import '../../controller/category_cubit/category_cubit.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CategoryCubit>(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
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
    );
  }
}
