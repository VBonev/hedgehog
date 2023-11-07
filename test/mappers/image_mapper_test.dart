import 'package:flutter_test/flutter_test.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/infra/mapper/image_mapper.dart';
import 'package:imgur/infra/storage/shared_preferences_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:network/models/common/album_dto.dart';
import 'package:network/models/common/image_dto.dart';
import 'package:network/models/response/images_response.dart';

@GenerateMocks([SharedPreferencesManager])
void main() {
  group(
    'ImageMapperTest',
    () {
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
      final multipleValidImages = ImagesResponse(
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
                id: 'gdfgfd',
                title: 'Image',
                views: 100,
                favorite: false,
                type: 'jpeg',
                link: 'https://i.imgur.com/hgf.jpg',
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageDTO(
                id: 'gnbvrter',
                title: 'Image',
                views: 100,
                favorite: false,
                link: 'https://i.imgur.com/gNrewUyuzu.jpg',
                type: 'jpeg',
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

      test(
        'Return only one valid image',
        () async {
          expect(
            ImageMapper.map(singleImageResponse),
            [
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
            ],
          );
        },
      );
      test(
        'Return empty list when there are no valid images',
        () async {
          expect(
            ImageMapper.map(noValidImageResponse),
            [],
          );
        },
      );
      test(
        'Return empty list when there are no valid images',
        () async {
          expect(
            ImageMapper.map(multipleValidImages),
            [
              ImageModel(
                id: 'LQOfCny',
                link: 'https://i.imgur.com/gNUyuzu.jpg',
                title: 'Image',
                views: 100,
                isFavorite: false,
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageModel(
                id: 'gdfgfd',
                link: 'https://i.imgur.com/hgf.jpg',
                title: 'Image',
                views: 100,
                isFavorite: false,
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
              ImageModel(
                id: 'gnbvrter',
                link: 'https://i.imgur.com/gNrewUyuzu.jpg',
                title: 'Image',
                views: 100,
                isFavorite: false,
                ups: 100,
                downs: 100,
                points: 100,
                score: 100,
              ),
            ],
          );
        },
      );


        test(
          'Set all images to be favorite from the saved values',
              () async {

            expect(
              ImageMapper.addFavorites(images,{
                'LQOfCny': true,
                'L23fCny': true,
                'LQ43ny': true,
              }),
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

            expect(
              ImageMapper.addFavorites(images,{}),
              images,
            );
          },
        );

    },
  );
}
