import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SearchCustomContainer extends StatelessWidget {
  const SearchCustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRouter.rSearchView);
        },
        child: Container(
          width: double.infinity,
          height: 47,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child:  Row(
            spacing: 5,
            children: [
              const Icon(Icons.search),
              Text(
                '${S.of(context).searchText}...',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
