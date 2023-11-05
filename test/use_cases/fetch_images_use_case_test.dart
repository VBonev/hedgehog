import 'package:flutter_test/flutter_test.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/infra/repositories/fetch_images/fetch_images_repository.dart';
import 'package:imgur/infra/storage/shared_preferences_manager.dart';
import 'package:imgur/infra/use_cases/add_favorites_use_case.dart';
import 'package:imgur/infra/use_cases/fetch_images_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network/models/common/album_dto.dart';
import 'package:network/models/common/image_dto.dart';
import 'package:network/models/response/images_response.dart';

import 'fetch_images_use_case_test.mocks.dart';

@GenerateMocks([FetchImagesRepository])
@GenerateMocks([SharedPreferencesManager])
void main() {
  group(
    'FetchImagesUseCase',
    () {
      final singleImageResponse = ImagesResponse(
        data: [
          AlbumDTO(
            id: 'LQOfCny',
            title: 'Album',
            datetime: 1698947021,
            images: [
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'jpeg',
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'gif',
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'gif',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              )
            ],
            views: 100,
            ups: 100,
            downs: 100,
            points: 100,
            score: 100,
          )
        ],
      );
      final noValidImageResponse = ImagesResponse(
        data: [
          AlbumDTO(
            id: 'LQOfCny',
            title: 'Album',
            datetime: 1698947021,
            images: [
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'gif',
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'gif',
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageDTO(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'gif',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              )
            ],
            views: 100,
            ups: 100,
            downs: 100,
            points: 100,
            score: 100,
          )
        ],
      );
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
      final imagesRepo = MockFetchImagesRepository();
      final sharedPrefs = MockSharedPreferencesManager();
      final fetchImages = FetchImagesUseCase(
        imagesRepo,
        AddFavoritesUseCase(
          sharedPrefs,
        ),
      );

      test(
        'Return list of images that has valid url and is with type==jpeg',
        () async {
          when(imagesRepo.getPopularImages()).thenAnswer((result) => Future(
                () => singleImageResponse,
              ));
          when(sharedPrefs.getFavorites()).thenAnswer(
            (result) => {},
          );
          expect(
            await fetchImages(),
            images,
          );
        },
      );

      test(
        'Return empty images list if there is no image with type== jpeg or valid url',
        () async {
          when(imagesRepo.getPopularImages()).thenAnswer((result) => Future(
                () => noValidImageResponse,
              ));
          when(sharedPrefs.getFavorites()).thenAnswer(
            (result) => {},
          );
          expect(
            await fetchImages(),
            [],
          );
        },
      );
    },
  );
}
