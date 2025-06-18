import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/login_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/register_view.dart';
import 'package:online_shop_app/features/category/data/models/category_model/category_model.dart';
import 'package:online_shop_app/features/category/presentation/views/category_product_view.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/views/google_maps_view.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo_impl.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:online_shop_app/features/home/presentation/views/home_view.dart';
import 'package:online_shop_app/features/home/presentation/views/product_detail_view.dart';
import 'package:online_shop_app/features/home/presentation/views/search_view.dart';

abstract class AppRouter {
  static const rLoginView = '/';
  static const rRegisterView = '/RegisterView';
  static const rHomeView = '/HomeView';
  static const rForgetPassView = '/ForgetPasswordView';
  static const rGoogleMapsView = '/GoogleMapsView';
  static const rProductDetailsView = '/ProductDetailView';
  static const rSearchView = '/SearchView';
  static const rProductCategory = '/ProductCategory';

  static final router = GoRouter(
    initialLocation: initialLocation(),
    routes: [
      GoRoute(
        path: rLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: rRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: rForgetPassView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: rHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: rProductDetailsView,
        builder: (context, state) => ProductDetailView(
          productModel: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: rGoogleMapsView,
        builder: (context, state) => BlocProvider(
            create: (context) => GoogleMapsCubit(),
            child: GoogleMapsView(
              placesModel: PlacesModel(),
            )),
      ),
      GoRoute(
        path: rSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
            child: const SearchView()),
      ),
      GoRoute(
        path: rProductCategory,
        builder: (context, state) =>    CategoryProductView(
          categoryModel: state.extra as CategoryModel,
        ),
      ),
    ],
  );

  static String initialLocation() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? rHomeView : rLoginView;
  }
}
