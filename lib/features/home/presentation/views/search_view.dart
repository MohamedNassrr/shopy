import 'package:flutter/material.dart';
import 'package:online_shop_app/features/home/data/models/search_model/search_model.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SearchViewBody(searchModel: searchModel,),
      ),
    );
  }
}
