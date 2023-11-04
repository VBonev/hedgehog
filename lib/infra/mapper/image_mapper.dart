import 'package:network/models/common/album_dto.dart';
import 'package:network/models/common/image_dto.dart';
import 'package:network/models/response/images_response.dart';
import '../../extensions/list_extensions.dart';
import '../../feature_images_overview/model/image_model.dart';

abstract class ImageMapper {
  static const _imageType = 'jpeg';

  static List<ImageModel> map(ImagesResponse response) {
    final list = response.data?.map(
          (element) {
            return _mapSingleImage(
              album: element,
              model: element.images?.firstWhereOrNull(
                (element) {
                  return element.type?.contains(_imageType) == true;
                },
              ),
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
        favorite: model?.favorite,
        ups: model?.ups ?? album?.ups,
        downs: model?.downs ?? album?.downs,
        points: model?.points ?? album?.points,
        score: model?.score ?? album?.score,
      );
}
