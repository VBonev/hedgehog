import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/feature_images_overview/bloc/fetch_images_cubit.dart';
import 'package:imgur/feature_images_overview/bloc/fetch_images_state.dart';
import 'package:imgur/infra/use_cases/add_favorites_use_case.dart';
import 'package:imgur/infra/use_cases/fetch_images_use_case.dart';
import 'package:imgur/infra/use_cases/search_image_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'fetch_images_cubit_test.mocks.dart';

@GenerateMocks([
  FetchImagesUseCase,
  AddFavoritesUseCase,
  SearchImageUseCase,
])
void main() {
  final addFavoritesUseCase = MockAddFavoritesUseCase();
  var fetchImagesUseCase = MockFetchImagesUseCase();
  var searchImageUseCase = MockSearchImageUseCase();
  final images = [
    ImageModel(
      id: 'LQOfCny',
      title: 'Image',
      views: 100,
      isFavorite: false,
      link: 'https://i.imgur.com/gNUyuzu.jpg',
      ups: 100,
      downs: 100,
      points: 100,
      score: 100,
    )
  ];
  blocTest<FetchImagesCubit, FetchImagesState>(
    'Given cubit was created, '
    'When doing nothing, '
    'Then [] should be emitted.',
    build: () => FetchImagesCubit(
      getImageUseCase: fetchImagesUseCase,
      searchImageUseCase: searchImageUseCase,
      addFavoritesUseCase: addFavoritesUseCase,
    ),
    expect: () => [],
  );

  blocTest<FetchImagesCubit, FetchImagesState>(
    'Given cubit was created, '
    'When fetching popular images, '
    'Then [FetchImagesStateLoading and FetchImagesStateLoaded]'
    'should be emitted.',
    build: () => FetchImagesCubit(
      getImageUseCase: fetchImagesUseCase,
      searchImageUseCase: searchImageUseCase,
      addFavoritesUseCase: addFavoritesUseCase,
    ),
    act: (cubit) async {
      when(
        fetchImagesUseCase(),
      ).thenAnswer((realInvocation) => Future.value(images));
      cubit.getPopularImages();
    },
    expect: () => [
      const FetchImagesStateLoading(),
      FetchImagesStateLoaded(images),
    ],
  );

  blocTest<FetchImagesCubit, FetchImagesState>(
    'Given cubit was created, '
    'When searching  images, '
    'Then [FetchImagesStateLoading and FetchImagesStateLoaded]'
    'should be emitted.',
    build: () => FetchImagesCubit(
      getImageUseCase: fetchImagesUseCase,
      searchImageUseCase: searchImageUseCase,
      addFavoritesUseCase: addFavoritesUseCase,
    ),
    act: (cubit) async {
      when(
        searchImageUseCase('query'),
      ).thenAnswer((realInvocation) => Future.value(images));
      cubit.searchImage(query: 'query');
    },
    expect: () => [
      const FetchImagesStateLoading(),
      FetchImagesStateLoaded(images),
    ],
  );

  blocTest<FetchImagesCubit, FetchImagesState>(
    'Given cubit was created, '
    'When setting favorite images, '
    'Then [FetchImagesStateLoaded and FetchImagesStateLoaded]'
    'should be emitted.',
    build: () => FetchImagesCubit(
      getImageUseCase: fetchImagesUseCase,
      searchImageUseCase: searchImageUseCase,
      addFavoritesUseCase: addFavoritesUseCase,
    ),
    act: (cubit) async {
      when(
        addFavoritesUseCase(images),
      ).thenAnswer((realInvocation) => images);
      cubit.addFavorites(images: images);
    },
    expect: () => [
      const FetchImagesStateLoaded([]),
      FetchImagesStateLoaded(images),
    ],
  );
}
