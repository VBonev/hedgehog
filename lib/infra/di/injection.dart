import 'package:get_it/get_it.dart';
import 'package:network/client/client.dart';

import '../../feature_images_overview/bloc/fetch_images_cubit.dart';
import '../../feature_images_overview/repository/fetch_images_repository.dart';
import '../repositories/fetch_images_repository_impl.dart';
import '../repositories/fetch_images_repository_mock.dart';
import '../use_cases/get_images_use_case.dart';
import '../use_cases/search_image_use_case.dart';

final getIt = GetIt.instance;

void setupDI({String? baseUrl}) {
  final isMock = baseUrl == null;

  if (!isMock) {
    getIt.registerLazySingleton<NetworkClient>(() => NetworkClient(baseUrl));
  }
  getIt.registerLazySingleton<FetchImagesRepository>(() => isMock
      ? FetchImagesRepositoryMock()
      : FetchImagesRepositoryImpl(getIt.get()));

  getIt.registerLazySingleton<GetImagesUseCase>(
      () => GetImagesUseCase(getIt.get()));

  getIt.registerLazySingleton<SearchImageUseCase>(
      () => SearchImageUseCase(getIt.get()));

  getIt.registerFactory<FetchImagesCubit>(() => FetchImagesCubit(
        getImageUseCase: getIt.get(),
        searchImageUseCase: getIt.get(),
      ));
}
