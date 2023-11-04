import 'package:network/models/common/album_dto.dart';
import 'package:network/models/common/image_dto.dart';
import 'package:network/models/response/images_response.dart';
import '../../extensions/list_extensions.dart';
import '../../feature_images_overview/model/image_model.dart';

abstract class ImageMapper {
  static const _imageType = 'jpeg';

  static List<ImageModel> map(
    ImagesResponse response,
  ) {
    final list = response.data?.map(
          (element) {
            var image = element.images?.firstWhereOrNull(
              (element) {
                return element.type?.contains(_imageType) == true;
              },
            );
            return _mapSingleImage(
              album: element,
              model: image,
            );
          },
        ).toList() ??
        [];
    list.removeWhere((element) => element.link == null);
    return list;
  }

  static ImageModel _mapSingleImage({
    AlbumDTO? album,
    ImageDTO? model,
  }) =>
      ImageModel(
        id: model?.id,
        link: model?.link,
        title: model?.title ?? album?.title,
        views: model?.views ?? album?.views,
        isFavorite: model?.favorite,
        ups: model?.ups ?? album?.ups,
        downs: model?.downs ?? album?.downs,
        points: model?.points ?? album?.points,
        score: model?.score ?? album?.score,
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
