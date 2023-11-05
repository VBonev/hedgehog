import 'package:get_it/get_it.dart';
import 'package:imgur/infra/use_cases/add_favorites_use_case.dart';
import 'package:network/client/client.dart';

import '../../feature_images_overview/bloc/fetch_images_cubit.dart';
import '../repositories/fetch_images/fetch_images_repository.dart';
import '../repositories/fetch_images/fetch_images_repository_impl.dart';
import '../repositories/fetch_images/fetch_images_repository_mock.dart';
import '../storage/shared_preferences_manager.dart';
import '../use_cases/fetch_images_use_case.dart';
import '../use_cases/search_image_use_case.dart';

final getIt = GetIt.instance;

void setupDI({String? baseUrl}) {
  final isMock = baseUrl == null;

  if (!isMock) {
    getIt.registerLazySingleton<NetworkClient>(() => NetworkClient(baseUrl));
  }
  getIt.registerLazySingleton<SharedPreferencesManager>(
      () => SharedPreferencesManager()..init());

  getIt.registerLazySingleton<FetchImagesRepository>(() => isMock
      ? FetchImagesRepositoryMock()
      : FetchImagesRepositoryImpl(getIt.get()));
  getIt.registerLazySingleton<AddFavoritesUseCase>(() => AddFavoritesUseCase(
        getIt.get(),
      ));
  getIt.registerLazySingleton<FetchImagesUseCase>(() => FetchImagesUseCase(
        getIt.get(),
        getIt.get(),
      ));

  getIt.registerLazySingleton<SearchImageUseCase>(() => SearchImageUseCase(
        getIt.get(),
        getIt.get(),
      ));

  getIt.registerFactory<FetchImagesCubit>(() => FetchImagesCubit(
        getImageUseCase: getIt.get(),
        searchImageUseCase: getIt.get(),
        addFavoritesUseCase: getIt.get(),
      ));
}
