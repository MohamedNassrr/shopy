import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/home/data/models/search_model/search_model.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_states.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchModel});

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        var searchCubit = BlocProvider.of<SearchCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      controller: searchController,
                      hintText: 'Search here ... ',
                      type: TextInputType.text,
                      onSubmit: (value){
                        searchCubit.fetchSearchItems(query: value);
                      },

                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${searchModel.title}'),
                      trailing: const Icon(Icons.arrow_forward),
                    );
                  },
                  itemCount: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
