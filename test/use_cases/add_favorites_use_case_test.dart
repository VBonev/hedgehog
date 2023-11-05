import 'package:flutter_test/flutter_test.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/infra/storage/shared_preferences_manager.dart';
import 'package:imgur/infra/use_cases/add_favorites_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_images_use_case_test.mocks.dart';

@GenerateMocks([SharedPreferencesManager])
void main() {
  group(
    'AddFavoritesUseCase',
    () {
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
        ),
        ImageModel(
          id: 'L23fCny',
          title: 'Image',
          views: 100,
          isFavorite: false,
          link: 'https://i.imgur.com/gNUyuzu.jpg',
          ups: 100,
          downs: 100,
          points: 100,
          score: 100,
        ),
        ImageModel(
          id: 'LQ43ny',
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
      final sharedPrefs = MockSharedPreferencesManager();
      final fetchImages = AddFavoritesUseCase(sharedPrefs);

      test(
        'Set all images to be favorite from the saved values',
        () async {
          when(sharedPrefs.getFavorites()).thenAnswer(
            (result) => {
              'LQOfCny': true,
              'L23fCny': true,
              'LQ43ny': true,
            },
          );
          expect(
            fetchImages(images),
            [
              ImageModel(
                id: 'LQOfCny',
                title: 'Image',
                views: 100,
                isFavorite: true,
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageModel(
                id: 'L23fCny',
                title: 'Image',
                views: 100,
                isFavorite: true,
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageModel(
                id: 'LQ43ny',
                title: 'Image',
                views: 100,
                isFavorite: true,
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              )
            ],
          );
        },
      );
      test(
        'Return unmodified list if no favorites are saved yet',
        () async {
          when(sharedPrefs.getFavorites()).thenAnswer(
            (result) => {},
          );
          expect(
            fetchImages(images),
            images,
          );
        },
      );
    },
  );
}
