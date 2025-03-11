import 'package:get_it/get_it.dart';
import 'package:online_shop_app/core/services/api_service.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
