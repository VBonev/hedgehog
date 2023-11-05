import 'package:json_annotation/json_annotation.dart';

import 'image_dto.dart';

part 'album_dto.g.dart';

@JsonSerializable(createToJson: false)
class AlbumDTO {
  AlbumDTO({
    required this.id,
    this.title,
    this.datetime,
    this.images,
    this.views,
    this.ups,
    this.downs,
    this.points,
    this.score,
  });

  factory AlbumDTO.fromJson(Map<String, dynamic> json) =>
      _$AlbumDTOFromJson(json);

  final String id;
  final String? title;
  final int? datetime;
  final List<ImageDTO>? images;
  final int? views;
  final int? ups;
  final int? downs;
  final int? points;
  final int? score;
}
