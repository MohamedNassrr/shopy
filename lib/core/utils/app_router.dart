import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/login_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/register_view.dart';
import 'package:online_shop_app/features/google_maps/data/models/places_model/places_model.dart';
import 'package:online_shop_app/features/google_maps/presentation/controller/google_maps_cubit/google_maps_cubit.dart';
import 'package:online_shop_app/features/google_maps/presentation/views/google_maps_view.dart';
import 'package:online_shop_app/features/home/data/models/product_model/product_model.dart';
import 'package:online_shop_app/features/home/data/models/search_model/search_model.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo_impl.dart';
import 'package:online_shop_app/features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:online_shop_app/features/home/presentation/views/home_view.dart';
import 'package:online_shop_app/features/home/presentation/views/product_detail_view.dart';
import 'package:online_shop_app/features/home/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kForgetPassView = '/ForgetPasswordView';
  static const kGoogleMapsView = '/GoogleMapsView';
  static const kProductDetailsView = '/ProductDetailView';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(
    initialLocation: initialLocation(),
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kForgetPassView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => ProductDetailView(
          productModel: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: kGoogleMapsView,
        builder: (context, state) => BlocProvider(
            create: (context) => GoogleMapsCubit(),
            child: GoogleMapsView(
              placesModel: PlacesModel(),
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<HomeRepoImpl>()),
            child: SearchView(
              searchModel: SearchModel(),
            )),
      ),
    ],
  );

  static String initialLocation() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? kHomeView : kLoginView;
  }
}
