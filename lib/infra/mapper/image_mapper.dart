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
              element.images?.firstWhereOrNull(
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

  static ImageModel _mapSingleImage(ImageDTO? model) => ImageModel(
        id: model?.id,
        link: model?.link,
        title: model?.title,
        views: model?.views,
        favorite: model?.favorite,
        ups: model?.ups,
        downs: model?.downs,
        points: model?.points,
        score: model?.score,
      );
}
