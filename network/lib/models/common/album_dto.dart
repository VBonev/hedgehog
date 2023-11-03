import 'package:json_annotation/json_annotation.dart';

import 'image_dto.dart';

part 'album_dto.g.dart';

@JsonSerializable(createToJson: false)
class Album {
  Album({
    required this.id,
    this.title,
    this.datetime,
    this.images,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  final String id;
  final String? title;
  final int? datetime;
  final List<ImageDTO>? images;
}
