import 'package:network/models/common/album_dto.dart';
import 'package:network/models/common/image_dto.dart';
import 'package:network/models/response/images_response.dart';
import '../../extensions/list_extensions.dart';
import '../../common_models/image_model.dart';

abstract class ImageMapper {
  static const _imageType = 'jpeg';

  static List<ImageModel> map(
    ImagesResponse response,
  ) {
    List<ImageModel> images = [];
    response.data?.forEach((album) {
      final tempImages = album.images;
      tempImages?.removeWhere((element) =>
          element.link == null || element.type?.contains(_imageType) == false);
      images.addAll(tempImages
              ?.map((image) => _mapSingleImage(
                    album: album,
                    image: image,
                  ))
              .toList() ??
          []);
    });
    return images;
  }

  static ImageModel _mapSingleImage({
    AlbumDTO? album,
    ImageDTO? image,
  }) =>
      ImageModel(
        id: image?.id,
        link: image?.link,
        title: image?.title ?? album?.title,
        views: image?.views ?? album?.views,
        isFavorite: image?.favorite,
        ups: image?.ups ?? album?.ups,
        downs: image?.downs ?? album?.downs,
        points: image?.points ?? album?.points,
        score: image?.score ?? album?.score,
      );

  static List<ImageModel> addFavorites(
    List<ImageModel> images,
    Map<String?, dynamic> favorites,
  ) {
    if (favorites.isNotEmpty) {
      favorites.forEach((key, value) {
        var imageModel = images.firstWhereOrNull((image) => image.id == key);
        if (imageModel != null) {
          imageModel.isFavorite = value;
        }
      });
    }
    return images;
  }
}
