import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable(createToJson: false)
class ImageDTO {
  ImageDTO({
    required this.id,
    this.title,
    this.type,
    this.views,
    this.favorite,
    this.link,
    this.ups,
    this.downs,
    this.points,
    this.score,
  });

  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);

  final String id;
  final String? title;
  final String? type;
  final int? views;
  final bool? favorite;
  final String? link;
  final int? ups;
  final int? downs;
  final int? points;
  final int? score;
}
