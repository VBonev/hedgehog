import 'package:json_annotation/json_annotation.dart';

import '../common/album_dto.dart';

part 'images_response.g.dart';

@JsonSerializable(createToJson: false)
class ImagesResponse {
  ImagesResponse({
    this.data,
  });

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  final List<Album>? data;
}
