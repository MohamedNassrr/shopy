import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_error_message.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_states.dart';
import 'package:online_shop_app/features/home/presentation/views/widgets/custom_circle_indicator.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  hintText: '${S.of(context).searchText} ... ',
                  hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
                  type: TextInputType.text,
                  onChanged: (_){
                    context.read<SearchCubit>().fetchSearchItems(query: searchController.text);
                 },

                ),
              ),
            ],
          ),
          BlocBuilder<SearchCubit,SearchStates>(
            builder: (context, state) {
              if(state is SearchSuccessStates){
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final search = state.productModel[index];
                      return ListTile(
                        title: Text('${search.title}'),
                        trailing: IconButton(
                            onPressed: (){
                              GoRouter.of(context).push(AppRouter.rProductDetailsView,extra: state.productModel[index],);
                            },
                            icon: const Icon(Icons.arrow_forward)
                        ),
                      );
                    },
                    itemCount: state.productModel.length,
                  ),
                );
              }else if (state is SearchFailureStates) {
                return CustomErrorWidget(errorMessage: state.failure);
              }else if (state is SearchLoadingStates){
                return const Padding(
                  padding: EdgeInsets.only(top: 260),
                  child: Center(child: CustomCircleIndicator(),),
                );
              }else{
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 260,),
                    Text(
                      S.of(context).searchHintText,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );

  }
}
