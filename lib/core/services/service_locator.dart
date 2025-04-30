import 'package:get_it/get_it.dart';
import 'package:online_shop_app/core/services/api_service.dart';
import 'package:online_shop_app/core/services/cart_service.dart';
import 'package:online_shop_app/core/services/google_auth_services.dart';
import 'package:online_shop_app/features/Cart/data/repos/cart_repo_impl.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<GoogleAuthService>(GoogleAuthService());

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


  getIt.registerSingleton<CartService>(CartService());
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(getIt.get<CartService>()),
  );
}
